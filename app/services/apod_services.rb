class ApodServices
  def initialize
    @_connection = Faraday.new(:url => "https://api.nasa.gov")
  end

  def picture_of_the_day
    parse(connection.get "/planetary/apod?api_key=#{ENV["nasa_api_key"]}")
  end

  private
    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
