class CoffeebeansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @coffeebeans = Coffeebean.new
  end

  def index
    @coffeebeans = Coffeebean.all
  end

  def create
    current_user.coffeebeans.create(coffee_params)
    redirect_to root_path
  end

  private

  def coffee_params
    params.require(:coffeebeans).permit(:name, :roast_type, :best_by)
  end
end
