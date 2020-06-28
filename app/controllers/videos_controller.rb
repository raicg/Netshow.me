class VideosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_views]
  before_action :set_video, only: [:show, :edit, :update, :destroy, :play, :update_views]

  respond_to :html, :js

  def index
    @videos = current_user.videos.paginate(per_page: 9, page: params[:page])

    respond_with @videos
  end

  def show
    respond_with @video
  end

  def new
    @video = current_user.videos.new

    respond_with @video
  end

  def edit
    respond_with @video
  end

  def create
    @video = current_user.videos.new(video_params)
    flash[:notice] = I18n.t(:created_resource, resource: I18n.t(:video, scope: "activerecord.models")) if @video.save

    respond_with @video
  end

  def update
    flash[:notice] = I18n.t(:updated_resource, resource: I18n.t(:video, scope: "activerecord.models")) if @video.update(video_params)
    
    respond_with @video
  end

  def destroy
    flash[:notice] = I18n.t(:destroyed_resource, resource: I18n.t(:video, scope: "activerecord.models")) if @video.destroy

    respond_with @video, :location => videos_url
  end

  def play
    respond_with @video
  end

  def update_views
    @video.update(views: @video.views + 1)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def video_params
    params.require(:video).permit(
      :name,
      :url
    )
  end
end
