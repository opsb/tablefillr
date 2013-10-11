class RestaurantTheme < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :theme
end
