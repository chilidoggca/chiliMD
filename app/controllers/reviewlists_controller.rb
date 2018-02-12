class ReviewlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_reviewable
  before_action :find_reviewable, except: [:create]

  def create
    reviewlist = @reviewable.reviewlists.new(params[:reviewable_id])
    reviewlist.user = current_user
      if reviewlist.save
        redirect_to @reviewable, notice: 'Added to review list.'
      else
        redirect_to @reviewable, notice: 'Could not be added to review list.'
      end
  end

  def update
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
    render nothing: true
  end

  private

  def find_reviewable
    @reviewlist = Reviewlist.find params[:id]
  end

  def load_reviewable
    resource, id = request.path.split('/')[1,2]
    @reviewable = resource.singularize.classify.constantize.find(id)
  end
end
