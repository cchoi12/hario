class CoffeebeansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @coffeebeans = Coffeebean.find_by_id(params[:id])
    return render_not_found if @gram.blank?
  end

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

  def edit
    @coffeebeans = Gram.find_by_id(params[:id])
    return render_not_found if @coffeebeans.blank?
  end

  private

  def coffee_params
    params.require(:coffeebeans).permit(:name, :brand, :roast_type, :best_by)
  end
end
