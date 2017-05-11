class CoffeebeansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :owned_beans, only: [:edit, :update, :destroy]  

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
        return render text: 'Cant let you do that', status: :forbidden
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

  def owned_beans
    unless current_user == @coffeebeans.user
      flash[:alert] = "Them beans don't belong to you!"
      redirect_to root_path
    end
  end

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
