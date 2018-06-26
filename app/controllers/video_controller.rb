class VideoController < ApplicationController
  def new
  end

  def create
    @video = Video.new(video_params)
    @video.clip = params["clip"]
    if @video.save!
      render "new"
    else
      render json: @video.errors.full_messages, status: 422
    end
  end

  private
  def video_params
    params.require(:video).permit(:title, :uploader_email, :uploader_name)
  end

end
