class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:format])
    begin
      current_user.follow(user)
      redirect_back fallback_location: user, notice: 'You followed this user!'
    rescue
      redirect_back fallback_location: user, notice: 'You can\'t follow yourself!'
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_back fallback_location: user, notice: 'You un-followed this user.'
  end
end
