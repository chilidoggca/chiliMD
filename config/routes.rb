Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # root 'posts#landing'
  authenticated :user do
    root :to => "users#show"
  end
  root :to => "posts#landing"

  resources :reviewlists do
    collection do
      patch :sort
    end
  end

  # devise routes
  devise_for :users, skip: [:sessions], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
    get 'events', to: 'reviewlists#events', as: :events
  end
  devise_scope :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
    # get "/auth/:provider/callback", to: "authentications#create"
  end

  # omniauth routes needed for multiple providers, if not working, wrap under devise_scope :user do
  # requires authentication controller
  # get "/auth/:provider/callback" => "authentications#create"

  resources :posts do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :reviewlists, only: [:create, :update, :destroy], shallow: true
    resources :comments, only: [:index, :new, :create, :destroy], shallow: true do
      resources :votes, shallow: true, only: [:create, :update, :destroy]
    end
  end

  resources :media do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :reviewlists, only: [:create, :update, :destroy], shallow: true
    resources :comments, only: [:index, :new, :create, :destroy], shallow: true do
      resources :votes, shallow: true, only: [:create, :update, :destroy]
    end
  end

  resources :contents, only: :index
  match '/contents/api', to: 'contents#api', via: :all
  resources :relationships, only: [:create, :destroy]
  resources :tags, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
