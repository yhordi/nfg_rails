module ApiStubs
  require 'json'
  def cal
   {"kind"=>"calendar#events", "etag"=>"\"1418016530566000\"", "summary"=>"Upcoming Shows", "description"=>"Upcoming performances", "updated"=>"2014-12-08T05:28:50.566Z", "timeZone"=>"America/Los_Angeles", "accessRole"=>"reader", "defaultReminders"=>[], "nextSyncToken"=>"CPCW3JzbtcICEAAYAQ==", "items"=>[{"kind"=>"calendar#event", "etag"=>"\"2781693726132000\"", "id"=>"nmuurbk5ru22jknkuchj1ug7cs", "status"=>"confirmed", "htmlLink"=>"https://www.google.com/calendar/event?eid=bm11dXJiazVydTIyamtua3VjaGoxdWc3Y3MgbmVidWxhZm9yY2Vnb0Bt", "created"=>"2014-01-27T18:21:03.000Z", "updated"=>"2014-01-27T18:21:03.066Z", "summary"=>"Nebula Force, Go! with Echo and Maw @ the Impact Theatre", "location"=>"Impact Theatre, 1834 Euclid Avenue, Berkeley, CA, United States", "creator"=>{"email"=>"nebulaforcego@gmail.com", "displayName"=>"Simon Miller", "self"=>true}, "organizer"=>{"email"=>"nebulaforcego@gmail.com", "displayName"=>"Simon Miller", "self"=>true}, "start"=>{"dateTime"=>"2014-02-15T20:00:00-08:00"}, "end"=>{"dateTime"=>"2014-02-15T23:00:00-08:00"}, "iCalUID"=>"nmuurbk5ru22jknkuchj1ug7cs@google.com", "sequence"=>0}]}
  end

  def cal_json
    cal.to_json
  end

  def youtube
    {"kind"=>"youtube#playlistItemListResponse", "etag"=>"\"F9iA7pnxqNgrkOutjQAa9F2k8HY/qKtJY_bpKbDUARCTz4jsK5i1FBQ\"", "pageInfo"=>{"totalResults"=>5, "resultsPerPage"=>5}, "items"=>[{"kind"=>"youtube#playlistItem", "etag"=>"\"F9iA7pnxqNgrkOutjQAa9F2k8HY/Y1gYGumWSOvgmFfWF59yeOLWeok\"", "id"=>"UUqeHwip54d6hPTiUBZ7ClXiovPyGuQBvL", "snippet"=>{"publishedAt"=>"2014-02-20T09:09:25.000Z", "channelId"=>"UCbmYMZyMPkoLUFRom02z-9w", "title"=>"Colossal @ Impact Theatre - 2/15/14", "description"=>"NF,G!'s tenth song of the set at Impact Theater on 2/15/2014.", "thumbnails"=>{"default"=>{"url"=>"https://i.ytimg.com/vi/d45LTwMZ6ks/default.jpg", "width"=>120, "height"=>90}, "medium"=>{"url"=>"https://i.ytimg.com/vi/d45LTwMZ6ks/mqdefault.jpg", "width"=>320, "height"=>180}, "high"=>{"url"=>"https://i.ytimg.com/vi/d45LTwMZ6ks/hqdefault.jpg", "width"=>480, "height"=>360}, "standard"=>{"url"=>"https://i.ytimg.com/vi/d45LTwMZ6ks/sddefault.jpg", "width"=>640, "height"=>480}, "maxres"=>{"url"=>"https://i.ytimg.com/vi/d45LTwMZ6ks/maxresdefault.jpg", "width"=>1280, "height"=>720}}, "channelTitle"=>"Nebula Force, Go", "playlistId"=>"UUbmYMZyMPkoLUFRom02z-9w", "position"=>0, "resourceId"=>{"kind"=>"youtube#video", "videoId"=>"d45LTwMZ6ks"}}}]}
  end

  def youtube_json
   youtube.to_json
  end
end