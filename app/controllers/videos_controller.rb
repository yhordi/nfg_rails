class VideosController < ApplicationController

  def index
    @response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=id&channelId=UCbmYMZyMPkoLUFRom02z-9w&key=#{ENV['GCAL_KEY']}")
    @parse = JSON.parse(@response.body)
  end
  def show
  end
end

