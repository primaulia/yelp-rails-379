class RestaurantsController < ApplicationController
  def show
    @resto = Restaurant.find(params[:id]) # resto instance by id = ?
  end
end
