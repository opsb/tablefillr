require Rails.root.join("lib", "themes", "theme_loader").to_s

class Theme < ActiveRecord::Base
	has_many :restaurant_themes
	has_many :restaurant, :through => :restaurant_themes

	has_many :pages, autosave: true
	has_permalink :name

	validates_presence_of :name

	def self.standard
		Theme.find_by_name("standard") || ThemeLoader.load!("standard")
	end
end
