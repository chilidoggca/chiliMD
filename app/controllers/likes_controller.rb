class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_likeable

  def create
    like = @likeable.likes.new(params[:likeable_id])
    like.user = current_user
      if like.save
        redirect_to @likeable, notice: 'You liked this content.'
      else
        redirect_to @likeable, notice: 'You could not like this content.'
      end
  end

  def destroy
    like = Like.find params[:id]
    @likeable = like.likeable
    if can? :destroy, like
      like.destroy
      redirect_to @likeable, notice: 'You un-liked this post.'
    else
      head :unauthorized
    end
  end

  def load_likeable
    resource, id = request.path.split('/')[1,2]
    @likeable = resource.singularize.classify.constantize.find(id)
  end

end
