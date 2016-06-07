class HomeController < ApplicationController
  def index
    service = ApodServices.new
    @picture_of_the_day = service.picture_of_the_day
  end
end
