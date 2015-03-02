require 'json'
class CalendarsController < ApplicationController
  include TimeHelper
  include HttpHelper
  def index
    @calendars = Calendar.order(time: :asc)
  end

  def create
    Calendar.delete_all
    quotaGuardProxy
    parse_json["items"].each do |item|
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
