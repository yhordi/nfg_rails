class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def create
    Video.delete_all
    @response = HTTParty.get("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUbmYMZyMPkoLUFRom02z-9w&key=#{ENV['GCAL_KEY']}")
    @parse = JSON.parse(@response.body)
    @parse["items"].each do |item|
      video_info = item["snippet"]["resourceId"]
      if video_info["kind"] == "youtube#video"
        Video.create(link: "http://youtube.com/embed/#{video_info["videoId"]}")
      end
    end
    redirect_to '/videos'
  end
end

