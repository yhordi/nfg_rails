module HttpHelper
  include JSON
  def quota_guard_proxy
    RestClient.proxy = "http://quotaguard2292:dbe18e7f7d41@us-east-1-static-brooks.quotaguard.com:9293"
  end

  def parse_json
    JSON.parse(RestClient.get("https://www.googleapis.com/calendar/v3/calendars/nebulaforcego%40gmail.com/events?key=#{ENV['GCAL_KEY']}").body).as_json
  end

  def get_youtube_channel
    RestClient.get("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&playlistId=PLWUsmk9lG38A4u9D2bYNNbD1o4hwd3nB7&fields=items&key=#{ENV['GCAL_KEY']}")
  end

  def youtube_headers
    {
      :expires => "Fri, 08 Jan 2016 22:38:45 GMT",
      :date => "Fri, 08 Jan 2016 22:38:45 GMT",
      :cache_control => "private, max-age=0, must-revalidate, no-transform",
      :etag => "\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/8UtYDcPC_JESXMVjcherD5H_Cw0\"",
      :vary => "Origin",
      :content_type => "application/json; charset=UTF-8",
      :x_content_type_options => "nosniff",
      :x_frame_options => "SAMEORIGIN",
      :x_xss_protection => "1; mode=block",
      :content_length => "3280",
      :server => "GSE",
      :alternate_protocol => "443:quic,p=1",
      :alt_svc => "quic=\":443\"; ma=604800; v=\"30,29,28,27,26,25\""
    }
  end

  def youtube_content_length
    get_youtube_channel.headers[:content_length].to_i    
  end
end