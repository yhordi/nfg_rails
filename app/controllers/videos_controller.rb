include HttpHelper
class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def create
    Video.delete_all
    quotaGuardProxy
    parse_json["items"].each do |item|
      video_info = item["snippet"]["resourceId"]
      if video_info["kind"] == "youtube#video"
        Video.create(link: "http://youtube.com/embed/#{video_info["videoId"]}")
      end
    end
    redirect_to '/videos'
  end
end

