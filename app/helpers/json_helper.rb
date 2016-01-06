module JsonHelper
  include JSON
  def mock_youtube
    "{\n \"kind\": \"youtube#playlistItemListResponse\",\n \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/COhGSN909yDepU9XkwIiXBRQQLo\\\"\",\n \"nextPageToken\": \"CAUQAA\",\n \"pageInfo\": {\n  \"totalResults\": 14,\n  \"resultsPerPage\": 5\n },\n \"items\": [\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/Tpyg_bSNwqrIo-Ja4Yu6UltsGtI\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoObN1Rv6KNByYLwBktGJLD8\",\n   \"contentDetails\": {\n    \"videoId\": \"_BHSGgxz4ek\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/K8IovJyRj5pH3Y8UlNsGLsp0-mk\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHmTGAuoUdWh38dOv8lRqv8\",\n   \"contentDetails\": {\n    \"videoId\": \"xWvGOLP3uRM\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/Ff1mxnd3FWdf6qiim0kc5vrRpeg\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoP_r5jodCKIW1XKj3RhAA08\",\n   \"contentDetails\": {\n    \"videoId\": \"Y1gqz5nrmMg\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/ZI_y0QQhzRmnYEX7bFqq7yHQtlA\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoKZdqqjBFnv34H7C84WcYII\",\n   \"contentDetails\": {\n    \"videoId\": \"d45LTwMZ6ks\"\n   }\n  },\n  {\n   \"kind\": \"youtube#playlistItem\",\n   \"etag\": \"\\\"kuL0kDMAqRo3pU7O0pwlO-Lfzp4/VC8HylDdXKNrhj0UOuvDYChKtvg\\\"\",\n   \"id\": \"PLrHycA__GCxRLGeePOJxFoHQg2WZzNsOkrc7q9cRqpV4\",\n   \"contentDetails\": {\n    \"videoId\": \"zzwLtXb4jBU\"\n   }\n  }\n ]\n}\n"
  end

  def parse_youtube
    ap parse(mock_youtube)
  end
end