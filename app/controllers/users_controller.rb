class UsersController < ApplicationController
  before_action :find_user, except: [:index]
  before_action :authenticate_user!

  def show
    # @user.posts = @user.posts.created_at_desc.paginate(page: params[:page])
    @following_posts = Post.where(user_id: @user.following.pluck(:id)).order(created_at: :desc)
    @following_media = Medium.where(user_id: @user.following.pluck(:id)).order(created_at: :desc)
  end

  def index
    @users = User.order(created_at: :asc)
  end

  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def following
    @title = "Following"
    @users = @user.following#.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers#.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      begin
      @user = User.find(params[:id])
      rescue
        @user = current_user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name, :email, :password, :profile_image)
    # end
end
