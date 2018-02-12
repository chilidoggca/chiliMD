class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_likeable
  before_action :authorize_user!, only: [:create]

  def create
    like = @likeable.likes.new(params[:likeable_id])
    like.user = current_user
      if like.save
        redirect_to @likeable, notice: 'You liked this content.'
      else
        redirect_to @likeable, notice: 'You can\'t like this content.'
      end
  end

  def destroy
    like = Like.find params[:id]
    puts @likeable
    puts "============================================="
    @likeable = like.likeable
    if can? :destroy, like
      like.destroy
      redirect_to @likeable, notice: 'You un-liked this content.'
    else
      head :unauthorized, notice: 'You can\'t un-like this content.'
    end
  end

  def load_likeable
    resource, id = request.path.split('/')[1,2]
    @likeable = resource.singularize.classify.constantize.find(id)
  end

  def authorize_user!
    unless can?(:like, @likeable)
      head :unauthorized, notice: 'You can\'t like this content.'
    end
  end

end
