class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    quota_guard_proxy
    # need to adjust get_youtube_channel method to get more videos
    ap get_youtube_channel.contentLength
    # ap parse(get_youtube_channel)
    # ap resp = ApiResponse.new(name: 'youtube', body: get_youtube_channel)
    # hash["items"].each { |item| puts item["contentDetails"]["videoId"] }

    redirect_to '/videos'
  end
end

