class DrinksController < ApplicationController

  def new
    @drink = Drink.new
  end

  def create
    modified_params = drink_params
    modified_params[:name] = modified_params[:name].capitalize
    @drink = Drink.new(modified_params)
    if @drink.save
      ##### post to api
    else
      render :new
    end
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :ingredients, :preparation, :image)
  end

end
