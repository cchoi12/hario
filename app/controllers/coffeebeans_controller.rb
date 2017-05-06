class CoffeebeansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def show
    @coffeebeans = Coffeebean.find_by_id(params[:id])
    # return render_not_found if @coffeebeans.blank?
  end

  def new
    @coffeebeans = Coffeebean.new
  end

  def update
    @coffeebeans = Coffeebean.find(params[:id])
    if @coffeebeans.user != current_user
        return render text: 'Not Allowed', status: :forbidden
    end

    @coffeebeans.update_attributes(coffee_params)
    if @coffeebeans.valid?
        redirect_to root_path
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def index
    @coffeebeans = Coffeebean.all
  end

  def create
    @coffeebeans = current_user.coffeebeans.create(coffee_params)
    if @coffeebeans.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @coffeebeans = Coffeebean.find_by_id(params[:id])

    if @coffeebeans.user != current_user
      return render text: 'Cant do that mon', status: :forbidden
    end

    return render_not_found if @coffeebeans.blank?
  end

  private

  def coffee_params
    params.require(:coffeebean).permit(
      :name,
      :brand,
      :roast_type,
      :best_by,
      :notes,
      :score
    )
  end
end
