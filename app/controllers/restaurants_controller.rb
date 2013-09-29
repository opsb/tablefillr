class RestaurantsController < ApplicationController
	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_parameters)

		if @restaurant.save
			redirect_to dashboard_path
		else
			render :new
		end
	end

	private
	def restaurant_parameters
		params.require(:restaurant).permit(:name, :address)
	end
end
