class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    # Video.delete_all
    quota_guard_proxy
    # p parse_json["items"]
    ap get_youtube_channel
    resp = ApiResponse.new(name: 'youtube', body: get_youtube_channel)
    if resp.body.valid?
      resp.save!
    else
      old_repsonse = ApiResponse.find_by_name('youtube')
      old_repsonse.update!(body: resp.body)
    end

    ap parse(old_repsonse)

    # parse_json["items"].each do |item|
      # video_info = item["snippet"]["resourceId"]
      # if video_info["kind"] == "youtube#video"
        # Video.create(link: "http://youtube.com/embed/#{video_info["videoId"]}")
      # end
    # end
    redirect_to '/videos'
  end
end

