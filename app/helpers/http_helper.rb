module HttpHelper
  include JSON
  def quota_guard_proxy
    RestClient.proxy = "http://quotaguard2292:dbe18e7f7d41@us-east-1-static-brooks.quotaguard.com:9293"
  end

  def parse_json
    JSON.parse(RestClient.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}").body).as_json
  end

  def parse_youtube_channel
    response = RestClient.get("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&playlistId=PLWUsmk9lG38A4u9D2bYNNbD1o4hwd3nB7&key=#{ENV['GCAL_KEY']}")
    parse!(response)
  end

  
end

