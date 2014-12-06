require 'json'

class CalendarsController < ApplicationController
  def index
  @response = HTTParty.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}")
  @parse = JSON.parse(@response.body).as_json
  p @parse
  end

end