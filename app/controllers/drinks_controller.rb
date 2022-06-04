class DrinksController < ApplicationController

  def new
    @drink = Drink.new
  end

  def create
    modified_params = drink_params
    modified_params[:name] = modified_params[:name].capitalize
    @drink = Drink.new(modified_params)
    if @drink.save
      post_api
      case @response.code
      when 201
        raise
        redirect_to added_drink_path
      when 422
        redirect_to not_unique_path
      else
        redirect_to root_path
      end
    else
      render :new
    end
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :ingredients, :preparation, :image)
  end

  def post_api
    body = { "cocktail": { "name": @drink.name, "ingredients": @drink.ingredients, "preparation": @drink.preparation, "image": @drink.image } }
    @response = RestClient.post('https://cocktail-database-api.herokuapp.com/api/v1/cocktails', body){|response, request, result| response }
    @data = JSON.parse(@response)
  end

end
