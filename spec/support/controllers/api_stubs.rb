module ApiStubs
  require 'json'
  def cal
   {"kind"=>"calendar#events", "etag"=>"\"1418016530566000\"", "summary"=>"Upcoming Shows", "description"=>"Upcoming performances", "updated"=>"2014-12-08T05:28:50.566Z", "timeZone"=>"America/Los_Angeles", "accessRole"=>"reader", "defaultReminders"=>[], "nextSyncToken"=>"CPCW3JzbtcICEAAYAQ==", "items"=>[{"kind"=>"calendar#event", "etag"=>"\"2781693726132000\"", "id"=>"nmuurbk5ru22jknkuchj1ug7cs", "status"=>"confirmed", "htmlLink"=>"https://www.google.com/calendar/event?eid=bm11dXJiazVydTIyamtua3VjaGoxdWc3Y3MgbmVidWxhZm9yY2Vnb0Bt", "created"=>"2014-01-27T18:21:03.000Z", "updated"=>"2014-01-27T18:21:03.066Z", "summary"=>"Nebula Force, Go! with Echo and Maw @ the Impact Theatre", "location"=>"Impact Theatre, 1834 Euclid Avenue, Berkeley, CA, United States", "creator"=>{"email"=>"nebulaforcego@gmail.com", "displayName"=>"Simon Miller", "self"=>true}, "organizer"=>{"email"=>"nebulaforcego@gmail.com", "displayName"=>"Simon Miller", "self"=>true}, "start"=>{"dateTime"=>"2014-02-15T20:00:00-08:00"}, "end"=>{"dateTime"=>"2014-02-15T23:00:00-08:00"}, "iCalUID"=>"nmuurbk5ru22jknkuchj1ug7cs@google.com", "sequence"=>0}]}
  end

  def cal_json
    cal.to_json
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

  def youtube
    "{\n \"items\": [\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/Tpyg_bSNwqrIo-Ja4Yu6UltsGtI\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoObN1Rv6KNByYLwBktGJLD8\",\n   \"contentDetails\": {\n    \"videoId\": \"_BHSGgxz4ek\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/K8IovJyRj5pH3Y8UlNsGLsp0-mk\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHmTGAuoUdWh38dOv8lRqv8\",\n   \"contentDetails\": {\n    \"videoId\": \"xWvGOLP3uRM\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/Ff1mxnd3FWdf6qiim0kc5vrRpeg\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoP_r5jodCKIW1XKj3RhAA08\",\n   \"contentDetails\": {\n    \"videoId\": \"Y1gqz5nrmMg\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/ZI_y0QQhzRmnYEX7bFqq7yHQtlA\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoKZdqqjBFnv34H7C84WcYII\",\n   \"contentDetails\": {\n    \"videoId\": \"d45LTwMZ6ks\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/VC8HylDdXKNrhj0UOuvDYChKtvg\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHQg2WZzNsOkrc7q9cRqpV4\",\n   \"contentDetails\": {\n    \"videoId\": \"zzwLtXb4jBU\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/OuX3sLDqTdwdxS9_E7xzuM5qocw\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoDG3x57AL-x8LzMTnBTi9UM\",\n   \"contentDetails\": {\n    \"videoId\": \"ISE3rFwks90\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/9wxvhR7EK8nbBi8OLAZFv75DwX4\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHJxgHkR6JL7aBUjuzeP6UY\",\n   \"contentDetails\": {\n    \"videoId\": \"M4Cq37J9vaY\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/Hq1Fu4I0BtOgQ0YBCBjD8MbOBRc\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoOMYs6OI-uUK-45wK1wkif0\",\n   \"contentDetails\": {\n    \"videoId\": \"EkgI5sj4lsU\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/pPKOBfeg3Ep8zNFDR7GmAc7ciBk\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHjJLZ9ZjBEy85FaNKxu5Ak\",\n   \"contentDetails\": {\n    \"videoId\": \"WhV7-ep5xCg\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/lVUnmIxVFy5tZPcduGui-GYuXy8\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoFf6mIyYFJLDtXXu28AZl8A\",\n   \"contentDetails\": {\n    \"videoId\": \"NN2ulx_SKOU\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/sg1mJ4Sa-KZxoIC9XeeyyrFbvjw\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoEgTZulad6EB6dWwSAzPXTA\",\n   \"contentDetails\": {\n    \"videoId\": \"DtKaQA-h-mE\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/MDmaawo1NnqT5XElQqb2E-RKoOs\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoCwWbTizCMZLCQ4z_ZTO2hc\",\n   \"contentDetails\": {\n    \"videoId\": \"_yOlihvcdLA\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/5lJJDtZbnBcBcCh-2d2oYBF38vE\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoGAVD3Pkxbd7NEksmbY9n7E\",\n   \"contentDetails\": {\n    \"videoId\": \"_f-EqH6JpNE\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"oqbvhYxBE6fAbRk6m7aLlHf5s1I/e85Vwhlw-cEEu2Zj9NkU9Zj1-Cs\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoENsgemAtqa2J2KBVIw96vU\",\n   \"contentDetails\": {\n    \"videoId\": \"mgSEmCNta7s\"\n   }\n  }\n ]\n}\n"
  end

end
