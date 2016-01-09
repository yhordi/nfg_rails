include JSON
require_relative '../app/helpers/http_helper'
# Post.create({
#   title: 'About Nebula Force, Go!',
#   author: 'Emerald',
#   body: "Nebula Force, Go! captures the trials and tribulations of the universe's brokenhearted would-be dinosaurs, spaceships yearning for adventure, and flesh loving surfer kaiju in songs that delight and entertain. Channeling the mighty intergalactic power that has been bestowed upon them, Nebula Force, Go!'s unique alt-nerdative style creates a brain-crushing singularity at the intersection of geek and music."
# })

# Post.create({
#   title: 'Thanks Impact!',
#   author: 'Emerald',
#   body: 'Nebula Force, Go! would like to heartily thank Impact Theatre for helping further the intergalactic stellarness that is Nebula Force, Go!'
# })

# User.create({
#   username: 'emerald',
#   password: ENV['PASSWORD']
# })

ap ApiResponse.create(name: 'youtube',
                   body: get_youtube_channel,
                   content_length: content_length)

hash = parse(ApiResponse.first.body)

hash["items"].each do |item| 
  ap Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}") 
end