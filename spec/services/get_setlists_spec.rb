require 'rails_helper'

describe Concert do
  # it "returns a 200 success header when the API call is made" do
  #   band = "KMFDM"
  #   venue = "House"
  #   response = Concert.get_concerts_list_by_artist(band, venue)
  #   expect(response.code).to(eq(200))
  # end

  it "returns setlists when the API call is made" do
    band = "KMFDM"
    venue = "House"
    response = Concert.get_concerts_list_by_artist(band, venue, city)
    expect(response).to_not(eq(nil))
  end
end
