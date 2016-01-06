class VideosController < ApplicationController
  include HttpHelper
  include JsonHelper

  def index
    @videos = Video.all
  end

  def create
    quota_guard_proxy
    ap resp = ApiResponse.new(name: 'youtube', body: get_youtube_channel)
    if resp.valid?
      # theory is that the responses are different each time so this isn't working

      resp.save!
    else
      old_repsonse = ApiResponse.find_by_name('youtube')
      old_repsonse.update!(body: resp.body)
      p '*'*50
      ap parse(old_repsonse)
    end
    # parse_json["items"].each do |item|
      # video_info = item["snippet"]["resourceId"]
      # if video_info["kind"] == "youtube#video"
        # Video.create(link: "http://youtube.com/embed/#{video_info["videoId"]}")
      # end
    # end
    redirect_to '/videos'
  end
end

