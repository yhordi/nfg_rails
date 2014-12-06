require 'json'
class CalendarsController < ApplicationController
  def index
    @response = HTTParty.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}")
    @parse = JSON.parse(@response.body).as_json
    @calendar = Calendar.new
    p @parse
  end

  def create
    @response = HTTParty.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}")
    @parse = JSON.parse(@response.body).as_json
    p @parse
    @parse["items"].each do |item|
      time = DateTime.iso8601(item["start"]["dateTime"])
      @calendar = Calendar.new
      @calendar.summary = item["summary"]
      @calendar.time = time.strftime("%A, %d %b %Y %l:%M %p")
      @calendar.location= item["location"]
      @calendar.save!
    end
    redirect_to '/'
  end

  def update
  end

  private

  def calendar_params
    params.require(:calendar).permit(:summary, :time, :description, :location, :maplink)
  end
end