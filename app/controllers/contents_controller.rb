class ContentsController < ApplicationController
  before_action :find_search_term

  def index
    # @contents = Post.all.to_a.concat(Medium.all).concat(User.all)

    model_name = params[:model_name]
    if model_name
      send(model_name)
    else
      send(:all)
    end
    # @images = @images.where("title ilike :search_term OR description ilike :search_term", search_term: "%#{search_term}%")
    # [model_name].where(
    #   "(title ilike :search_term OR description ilike :search_term) AND model_name LIKE :model_name",
    #   search_term: "%#{search_term}%"
    #   model_name: "#{model_name}"
    # )

  end

  private

  def find_search_term
    @search_term = params[:search_term]
  end

  def all
    @posts = Post.all.order(created_at: :desc).where("title ilike :search_term OR body ilike :search_term", search_term: "%#{@search_term}%")
    # @media = Medium.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @images = Medium.images.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @audios = Medium.audios.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @videos = Medium.videos.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @users = User.all.order(created_at: :desc).where("first_name ilike :search_term OR last_name ilike :search_term", search_term: "%#{@search_term}%")
  end

  def posts
    @posts = Post.all.order(created_at: :desc).where("title ilike :search_term OR body ilike :search_term", search_term: "%#{@search_term}%")
  end

  def media
    # @media = Medium.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @images = Medium.images.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @audios = Medium.audios.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
    @videos = Medium.videos.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
  end

  def images
    @images = Medium.images.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
  end

  def audios
    @audios = Medium.audios.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
  end

  def videos
    @videos = Medium.videos.all.order(created_at: :desc).where("title ilike :search_term OR description ilike :search_term", search_term: "%#{@search_term}%")
  end

  def users
    @users = User.all.order(created_at: :desc).where("first_name ilike :search_term OR last_name ilike :search_term", search_term: "%#{@search_term}%")
  end

end
