class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    quota_guard_proxy
    stored_youtube_response = ApiResponse.find_by_name('youtube')
    if stored_youtube_response == nil
      stored_youtube_response = ApiResponse.create!(
        name: 'youtube',
        body: get_youtube_channel,
        content_length: youtube_content_length)
    elsif youtube_content_length != stored_youtube_response.content_length
      stored_youtube_response.update(
        body: get_youtube_channel.body, 
        content_length: youtube_content_length)
    end

    response_hash = parse(stored_youtube_response.body)
    response_hash["items"].each do |item|
      Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}")
    end
    redirect_to '/videos'
  end
end

