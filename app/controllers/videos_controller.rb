class VideosController < ApplicationController
  include HttpHelper
  include JSON

  def index
    @videos = Video.all
  end

  def create
    quota_guard_proxy
    ApiResponse.create_or_update_response('youtube')
    stored_youtube_response = ApiResponse.find_by_name('youtube')
    stored_youtube_response.create_videos
    redirect_to '/videos'
  end

end

