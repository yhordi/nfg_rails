
class CalendarsController < ApplicationController
  def index
    p ENV['GCAL_KEY']
  @response = HTTParty.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}")
  p @response
  end

end