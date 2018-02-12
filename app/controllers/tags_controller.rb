class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_tag, only: [:show]
  # before_action :authorize_user!

  def create
    begin
      @tag = Tag.new(tag_params)
      @tag.save
    rescue
      redirect_back notice: 'Tag could not be created.'
    end
  end

  def show
  end

  # def destroy
  # end
  # doesn\'t make sense for users to delete tags as it could impact other users

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def authorize_user!
    unless can?(:crud, @tag)
      redirect_back alert: 'Access Denied!'
    end
  end

end
