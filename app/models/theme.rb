require Rails.root.join("lib", "themes", "theme_loader").to_s

class Theme < ActiveRecord::Base
	has_one :restaurant_theme
	has_one :restaurant, :through => :restaurant_theme

	def self.standard
		Theme.find_by_name("standard") || ThemeLoader.load!("standard")
	end
end
