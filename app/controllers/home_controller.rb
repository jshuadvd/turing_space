class HomeController < ApplicationController
  def index
    apod = ApodServices.new
    @picture_of_the_day = apod.picture_of_the_day
  end
end
