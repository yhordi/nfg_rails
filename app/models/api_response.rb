class ApiResponse < ActiveRecord::Base
  validates :body, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :content_length, presence: true

  def self.create_or_update_response(name)
    stored_response = ApiResponse.find_by_name(name)
    if stored_response == nil
      stored_response = ApiResponse.create!(
        name: name,
        body: get_youtube_channel,
        content_length: youtube_content_length(get_youtube_channel))
    elsif youtube_content_length(get_youtube_channel) != stored_response.content_length
      stored_response.update!(
        body: get_youtube_channel.body, 
        content_length: youtube_content_length(get_youtube_channel))
    end
  end

  def self.youtube_content_length(channel)
    channel.headers[:content_length].to_i    
  end


  def self.get_youtube_channel
    RestClient.get("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&playlistId=PLWUsmk9lG38A4u9D2bYNNbD1o4hwd3nB7&fields=items&key=#{ENV['GCAL_KEY']}")
  end

  def self.youtube_headers
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

  def create_videos
    response_hash = parse(stored_youtube_response.body)
    response_hash["items"].each do |item|
      Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}")
    end
  end

end