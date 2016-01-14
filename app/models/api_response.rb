class ApiResponse < ActiveRecord::Base
  include JSON
  validates :body, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :content_length, presence: true

  def self.create_or_update(name)
    stored_response = ApiResponse.find_by_name(name)
    if stored_response.nil?
      ApiResponse.create_response(name)
    elsif youtube_content_length(get_youtube_channel) != stored_response.content_length
      ApiResponse.update_response(stored_response)
    end
  end

  def self.create_response(name)
    ApiResponse.create!(
      name: name,
      body: get_youtube_channel,
      content_length: youtube_content_length(get_youtube_channel))
  end

  def self.update_response(response)
    response.update!(
      body: get_youtube_channel.body, 
      content_length: youtube_content_length(get_youtube_channel))
  end

  def self.youtube_content_length(channel)
    channel.headers[:content_length].to_i    
  end


  def self.get_youtube_channel
    RestClient.get("https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&playlistId=PLWUsmk9lG38A4u9D2bYNNbD1o4hwd3nB7&fields=items&key=#{ENV['GCAL_KEY']}")
  end

  def create_videos
    response_hash = parse(self.body)
    response_hash["items"].each do |item|
      Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}")
    end
  end

end