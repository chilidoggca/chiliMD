class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :landing]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def landing
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page]).order(created_at: :desc)

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # @commentable = @post
    @comments = @post.comments
    @comment = Comment.new
    @media = @post.media.order(created_at: :desc)
    @references = @post.references.order(created_at: :asc)
    @user_like = current_user.likes.find_by_likeable_id(@post) if user_signed_in?
    @user_reviewlist = current_user.reviewlists.find_by_reviewable_id(@post) if user_signed_in?
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    respond_to do |format|
      @post = current_user.posts.new(post_params)
      @post.media.each{|medium| medium.user = current_user}
      # @post.tag_ids.each{|tag_id| Tagging.create()}
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      @post.update(post_params)
      @post.media.each{|medium| medium.user = current_user}
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :published, { tag_ids: [] },
        media_attributes: [:id, :title, :attachment_file, :_destroy],
        references_attributes: [:id, :body, :url, :doi, :_destroy])
    end

    def authorize_user!
      unless can?(:crud, @post)
        flash[:alert] = "Access Denied!"
        redirect_to @post
      end
    end

end
