class VideosController < ApplicationController
  include HttpHelper

  def index
    @videos = Video.all
  end

  def create
    # Video.delete_all
    quota_guard_proxy
    p parse_json["items"]
    parse_json["items"].each do |item|
      video_info = item["snippet"]["resourceId"]
      if video_info["kind"] == "youtube#video"
        Video.create(link: "http://youtube.com/embed/#{video_info["videoId"]}")
      end
    end
    redirect_to '/videos'
  end
end

