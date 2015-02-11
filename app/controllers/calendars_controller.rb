require 'json'
include TimeHelper

class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.order(time: :asc)
  end

  def create
    Calendar.delete_all
    RestClient.proxy = "http://quotaguard2292:dbe18e7f7d41@us-east-1-static-brooks.quotaguard.com:9293"
    @response = RestClient.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}")
    # headers: {"X-Forwarded-For" => request.remote_ip}
    puts "*"*50
    ap @response
    puts "*"*50
    # ap request
    ap request.remote_ip
    @parse = JSON.parse(@response.body).as_json
    @parse["items"].each do |item|
      time = DateTime.iso8601(item["start"]["dateTime"])
      @calendar = Calendar.new(summary: item["summary"], time: time, description: item["description"], readable_time: format_time(time), location: item["location"])
      @calendar.save
    end
    redirect_to '/calendars'
  end
  private

  def calendar_params
    params.require(:calendar).permit(:summary, :time, :description, :location, :maplink)
  end
end
