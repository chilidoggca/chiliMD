class ContentsController < ApplicationController
  before_action :find_search_term

  def index
    # @contents = Post.to_a.concat(Medium.all).concat(User.all)

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

  def api
    @posts = Post.order(created_at: :desc)
    @media = Medium.order(created_at: :desc)
    @users = User.order(created_at: :desc)
    @tags = Tag.order(created_at: :asc)
    render json: {:posts => @posts, :images => @media.images, :videos => @media.videos, :audios => @media.audios, :users => @users, :tags => @tags}
  end

  private

  def find_search_term
    @search_term = params[:search_term]
  end

  def all
    @posts = Post.search_term_desc(@search_term).paginate(:page => params[:page])
    @images = Medium.images.search_term_desc(@search_term).paginate(:page => params[:page])
    @audios = Medium.audios.search_term_desc(@search_term).paginate(:page => params[:page])
    @videos = Medium.videos.search_term_desc(@search_term).paginate(:page => params[:page])
    @users = User.search_term_desc(@search_term).paginate(:page => params[:page])
  end

  def posts
    @posts = Post.search_term_desc(@search_term).paginate(:page => params[:page])
  end

  def media
    @images = Medium.images.search_term_desc(@search_term).paginate(:page => params[:page])
    @audios = Medium.audios.search_term_desc(@search_term).paginate(:page => params[:page])
    @videos = Medium.videos.search_term_desc(@search_term).paginate(:page => params[:page])
  end

  def images
    @images = Medium.images.search_term_desc(@search_term).paginate(:page => params[:page])
  end

  def audios
    @audios = Medium.audios.search_term_desc(@search_term).paginate(:page => params[:page])
  end

  def videos
    @videos = Medium.videos.search_term_desc(@search_term).paginate(:page => params[:page])
  end

  def users
    @users = User.search_term_desc(@search_term).paginate(:page => params[:page])
  end

end
