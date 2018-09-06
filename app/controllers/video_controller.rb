class VideoController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.clip = params["video"]["clip"]
    if @video.save
      render "new"
    else
      render json: @video.errors.full_messages, status: 422
    end
  end

  private
  def video_params
    params.require(:video).permit( :title, :uploader_name, :uploader_email,
                                  :genre, :end_airing_date, :series, :crew,
                                  :additional_info
                                 )
  end

end
