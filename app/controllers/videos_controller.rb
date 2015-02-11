class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def create
    Video.delete_all
    RestClient.proxy = "http://quotaguard2292:dbe18e7f7d41@us-east-1-static-brooks.quotaguard.com:9293"
    @response = RestClient.get("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=UUbmYMZyMPkoLUFRom02z-9w&key=#{ENV['GCAL_KEY']}")
    puts @response
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

