class Concert
  def self.get_concerts_list_by_artist(artist)
    response = RestClient::Request.execute(method: :get, url: "https://api.setlist.fm/rest/1.0/search/setlists?artistName=#{artist}", headers: {x_api_key: x-api-key)
    JSON.parse(response)
  end
end
