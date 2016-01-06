class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    # Video.delete_all
    parse_youtube
    # quota_guard_proxy
    # p parse_json["items"]

    RestClient.get("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&playlistId=PLWUsmk9lG38A4u9D2bYNNbD1o4hwd3nB7&key=#{ENV['GCAL_KEY']}")

    # parse_json["items"].each do |item|
      # video_info = item["snippet"]["resourceId"]
      # if video_info["kind"] == "youtube#video"
        # Video.create(link: "http://youtube.com/embed/#{video_info["videoId"]}")
      # end
    # end
    redirect_to '/videos'
  end
end

