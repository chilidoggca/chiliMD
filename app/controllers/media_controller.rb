class MediaController < ApplicationController
  before_action :find_medium, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
  end

  # GET /media/1
  # GET /media/1.json
  def show
    @commentable = @medium
    @comments = @commentable.comments
    @comment = Comment.new
    @references = @medium.references.order(created_at: :asc)
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  def create
    respond_to do |format|
      @medium = current_user.media.new(medium_params)
      if @medium.save
        format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      # @medium.assign_attributes(medium_params)
      if @medium.update(medium_params)
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def find_medium
    @medium = Medium.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def medium_params
    params.require(:medium).permit(:title, :description, :attachment_file,
      references_attributes: [:id, :body, :url, :doi, :_destroy])
  end

  def authorize_user!
    unless can?(:crud, @medium)
      flash[:alert] = "Access Denied!"
      redirect_to @medium
    end
  end

end
