class ReviewlistsController < ApplicationController
  before_action :authenticate_user!, except: [:events, :update]
  before_action :load_reviewable, except: [:sort, :events]
  before_action :find_reviewable, except: [:create, :sort, :events]
  protect_from_forgery except: [:sort, :events, :update]
  skip_before_action :verify_authenticity_token, only: [:update]

  def create
    reviewlist = @reviewable.reviewlists.new(params[:reviewable_id])
    reviewlist.user = current_user
      if reviewlist.save
        redirect_to @reviewable, notice: 'Added to review list.'
      else
        redirect_to @reviewable, notice: 'Could not be added to review list.'
      end
  end

  def events
    @user = User.find params[:user_id]
    @reviewlists = @user.reviewlists
    render json: @reviewlists
  end

  def update
    @reviewlist = Reviewlist.find params[:id]
    @reviewlist.update(reviewlist_params)
    rescue
    head :unauthorized, notice: 'Reviewlist could not be updated.'
  end

  def destroy
    @reviewable = @reviewlist.reviewable
    if can? :destroy, @reviewlist
      @reviewlist.destroy
      redirect_to @reviewable, notice: 'Removed from review list.'
    else
      head :unauthorized, notice: 'Can\'t be removed from review list.'
    end
  end

  def sort
    params[:reviewlist].each_with_index do |id, index|
      Reviewlist.where(id: id).update_all(position: index + 1)
    end
  end

  private

  def find_reviewable
    @reviewlist = Reviewlist.find params[:id]
  end

  def load_reviewable
    resource, id = request.path.split('/')[1,2]
    @reviewable = resource.singularize.classify.constantize.find(id)
  end

  def reviewlist_params
    params.require(:reviewlist).permit(:id, :start_date)
  end

end
