class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    quota_guard_proxy
    stored_youtube_response = ApiResponse.find_by_name('youtube')
    if youtube_content_length != stored_youtube_response.content_length
      ApiResponse.update!(body: get_youtube_channel, 
                          content_length: youtube_content_length)
    end
    response_hash = parse(stored_youtube_response)
    response_hash["items"].each do |item|
      Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}")
    end
    # hash["items"].each { |item| puts item["contentDetails"]["videoId"] }

    redirect_to '/videos'
  end
end

