class Theme < ActiveRecord::Base
	has_many :restaurant_themes
	has_many :restaurant, :through => :restaurant_themes

	has_many :pages, autosave: true
	has_many :layouts, autosave: true do
		def main
			self.find_by_name("main")
		end
	end
	has_permalink :name

	validates_presence_of :name

	accepts_nested_attributes_for :pages, :layouts

	def self.standard
		Theme.find_by_name("standard") || Theme.create(ThemeLoader.load("standard"))
	end
end
