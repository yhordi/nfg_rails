class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    quota_guard_proxy
    ApiResponse.create_or_update_response('youtube')
    stored_youtube_response = ApiResponse.find_by_name('youtube')
    response_hash = parse(stored_youtube_response.body)
    response_hash["items"].each do |item|
      Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}")
    end
    redirect_to '/videos'
  end
end

