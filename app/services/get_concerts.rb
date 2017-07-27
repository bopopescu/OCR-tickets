class Concert
  def self.get_concerts_list_by_artist(artist)
    response = RestClient::Request.execute(method: :get, url: "https://api.setlist.fm/rest/1.0/search/setlists?artistName=#{artist}", headers: {x_api_key: ENV['x_api_key'], Accept: 'application/json'})
    # response["setlist"][0]["sets"]["set"]
    # binding.pry
  end
end


#mainset
# response["setlist"][0]["sets"]["set"][0]
# {"song"=>
#   [{"name"=>"Money"},
#    {"name"=>"Light"},
#    {"name"=>"Ultra"},
#    {"name"=>"Rebels in Kontrol"},
#    {"name"=>"Tohuvabohu"},
#    {"name"=>"Shake the Cage"},
#    {"name"=>"Son of a Gun"},
#    {"name"=>"Last Things"},
#    {"name"=>"Brainwashed"},
#    {"name"=>"Animal Out"},
#    {"name"=>"Salvation"},
#    {"name"=>"Megalomaniac"},
#    {"name"=>"WWIII"},
#    {"name"=>"Amnesia"},
#    {"name"=>"Hau Ruck"}]}

# encore:
# response["setlist"][0]["sets"]["set"][1]
# {"encore"=>1, "song"=>[{"name"=>"A Drug Against War"}, {"name"=>"Adios"}, {"name"=>"Godlike"}]}
