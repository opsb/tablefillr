class RestaurantsController < ApplicationController
	def new
		@restaurant = Restaurant.new
		@restaurant.users.build
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
		params.require(:restaurant).permit(:name, :address, :users_attributes => [:id, :first_name, :last_name, :email, :password])
	end
end
