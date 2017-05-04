class StaticPageController < ApplicationController
  def index
    @coffeebeans = Coffeebean.all
  end
end
