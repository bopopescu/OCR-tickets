class Ticket < ActiveRecord::Base
  has_attached_file :ticket_img, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :ticket_img, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :band, :venue, :city, :date

  def get_concerts_list_by_artist(artist, venue, city)
    response = RestClient::Request.execute(method: :get, url: "https://api.setlist.fm/rest/1.0/search/setlists?artistName=#{artist}&venueName=#{venue}&cityName=#{city}", headers: {x_api_key: ENV['x_api_key'], Accept: 'application/json'})
    # response["setlist"][0]["sets"]["set"]
    response = JSON.parse(response)["setlist"][0]["sets"]["set"][0]["song"]
  end


end
