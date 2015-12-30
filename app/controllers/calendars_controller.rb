require 'json'
class CalendarsController < ApplicationController
  include TimeHelper
  include HttpHelper
  def index
    @calendar = Calendar.new
    @calendars = Calendar.order(time: :asc)
  end

  def create
    p
    Calendar.delete_all
    quota_guard_proxy
    parse_json["items"].each do |item|
      time = DateTime.iso8601(item["start"]["dateTime"])
      @calendar = Calendar.new(summary: item["summary"], time: time, description: item["description"], readable_time: format_time(time), location: item["location"])
      @calendar.save
    end
    redirect_to '/calendars'
  end

end
