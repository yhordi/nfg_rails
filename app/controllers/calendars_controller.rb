require 'json'
include TimeHelper

class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.order(time: :asc)
  end

  def create
    Calendar.delete_all
    @response = HTTParty.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}")
    @parse = JSON.parse(@response.body).as_json
    @parse["items"].each do |item|
      time = DateTime.iso8601(item["start"]["dateTime"])
      @calendar = Calendar.new
      @calendar.summary = item["summary"]
      @calendar.time = time
      @calendar.description = item["description"]
      @calendar.readable_time = format_time(time)
      @calendar.location= item["location"]
      @calendar.save
    end
    redirect_to '/calendars'
  end

  private

  def calendar_params
    params.require(:calendar).permit(:summary, :time, :description, :location, :maplink)
  end
end