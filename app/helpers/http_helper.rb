module HttpHelper
  def quotaGuardProxy
    RestClient.proxy = "http://quotaguard2292:dbe18e7f7d41@us-east-1-static-brooks.quotaguard.com:9293"
  end

  def parse_json
    JSON.parse(RestClient.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}").body).as_json
  end
end
