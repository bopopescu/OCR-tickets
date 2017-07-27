require 'rails_helper'

describe Concert do
  it "returns a 200 success header when the API call is made" do
    band = "KMFDM"
    response = Concert.get_concerts_list_by_artist(band)
    expect(response.code).to(eq(200))
  end
end
