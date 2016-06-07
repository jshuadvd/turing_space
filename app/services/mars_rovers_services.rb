class MarsRoversServices
  def initialize
    @_connection = Faraday.new(:url=>"https://api.nasa.gov")
  end

  def curiousity_pictures
    path = "/mars-photos/api/v1/rovers/curiosity/photos"

    response = connection.get do |req|
      req.url path
      req.params['sol'] = 1003
      req.params['api_key'] = ENV["nasa_api_key"]
      req.params['camera'] = "NAVCAM"
    end

    parse(response)
  end

  def opportunity_pictures
    path = "/mars-photos/api/v1/rovers/opportunity/photos"

    response = connection.get do |req|
      req.url path
      req.params['sol'] = 950
      req.params['api_key'] = ENV["nasa_api_key"]
      req.params['camera'] = "NAVCAM"
    end

    parse(response)
  end

  def spirit_pictures
    path = "/mars-photos/api/v1/rovers/spirit/photos"

    response = connection.get do |req|
      req.url path
      req.params['sol'] = 10
      req.params['api_key'] = ENV["nasa_api_key"]
      req.params['camera'] = "NAVCAM"
    end

    parse(response)
  end

  private
    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)[:photos]
    end
end
