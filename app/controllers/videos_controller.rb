class VideosController < ApplicationController

  def index
    @response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCbmYMZyMPkoLUFRom02z-9w&key=#{ENV['GCAL_KEY']}")
    p @response

  end

  def show
  end
end