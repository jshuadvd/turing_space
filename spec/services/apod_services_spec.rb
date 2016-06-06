require 'rails_helper'

RSpec.describe ApodServices do
  it "returns the Astronomy Picture of the Day" do
    VCR.use_cassette "#picture_of_the_day" do
      service = ApodServices.new
      picture = service.picture_of_the_day

      expect(picture[:date]).to eq("2016-06-07")
      expect(picture[:explanation].length).to eq(1327)
      expect(picture[:title]).to eq("The Supernova and Cepheids of Spiral Galaxy UGC 9391")
      expect(picture[:hdurl]).to eq("http://apod.nasa.gov/apod/image/1606/UGC9391_hubble_2800_plain.jpg")
    end
  end
end
