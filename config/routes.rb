Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'posts#landing'

  # devise routes
  devise_for :users, skip: [:sessions], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
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
    resources :comments, only: [:index, :new, :create, :destroy], shallow: true
    # resources :media, shallow: true #not making a difference in saving to database
  end

  resources :media do
    resources :comments, only: [:index, :new, :create, :destroy], shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
