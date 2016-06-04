class MarsRoversServices
  def initialize
    @_connection = Faraday.new(:url=>"https://api.nasa.gov")
  end

  def curiousity_pictures
    # https://api.nasa.gov/mars-photos/api/v1/rovers/curiousity/photos?earth_date=2015-6-3&api_key=DEMO_KEY
  end

  def opportunity_pictures
    # https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?earth_date=2015-6-3&api_key=DEMO_KEY
  end

  def spirit_pictures
    # https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?earth_date=2015-6-3&api_key=DEMO_KEY
  end

  private
    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end

# ROVERS: Curiousity, Opportunity, Spirit
# Figure out a way how to make the dates dynamic to produce random images

# params["api_key"] = ENV["nasa_api_key"]
# https://api.nasa.gov/api.html#MarsPhotos
