class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def create
    @response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=id&channelId=UCbmYMZyMPkoLUFRom02z-9w&key=#{ENV['GCAL_KEY']}")
    @parse = JSON.parse(@response.body)
    @parse["items"].each do |item|
      if item["id"]["kind"]  == "youtube#video"
        Video.create(link: "http://youtube.com/embed/#{item["id"]["videoId"]}")
      end
    end
    redirect_to '/videos'
  end
end

