include JSON
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

ApiResponse.create({
  name: 'youtube',
  body: "{\n \"kind\": \"youtube#playlistItemListResponse\",\n \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/-J4t_qkwx15RGb28zDz5jgXJflA\\\"\",\n \"nextPageToken\": \"CAUQAA\",\n \"pageInfo\": {\n  \"totalResults\": 14,\n  \"resultsPerPage\": 5\n },\n \"items\": [\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/Tpyg_bSNwqrIo-Ja4Yu6UltsGtI\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoObN1Rv6KNByYLwBktGJLD8\",\n   \"contentDetails\": {\n    \"videoId\": \"_BHSGgxz4ek\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/K8IovJyRj5pH3Y8UlNsGLsp0-mk\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHmTGAuoUdWh38dOv8lRqv8\",\n   \"contentDetails\": {\n    \"videoId\": \"xWvGOLP3uRM\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/Ff1mxnd3FWdf6qiim0kc5vrRpeg\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoP_r5jodCKIW1XKj3RhAA08\",\n   \"contentDetails\": {\n    \"videoId\": \"Y1gqz5nrmMg\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/ZI_y0QQhzRmnYEX7bFqq7yHQtlA\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoKZdqqjBFnv34H7C84WcYII\",\n   \"contentDetails\": {\n    \"videoId\": \"d45LTwMZ6ks\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/VC8HylDdXKNrhj0UOuvDYChKtvg\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHQg2WZzNsOkrc7q9cRqpV4\",\n   \"contentDetails\": {\n    \"videoId\": \"zzwLtXb4jBU\"\n   }\n  }\n ]\n}\n"  
})

hash = parse(ApiResponse.first.body)

hash["items"].each do |item| 
  ap Video.create(link: "https://www.youtube.com/embed/#{item["contentDetails"]["videoId"]}") 
end