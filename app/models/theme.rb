class Theme < ActiveRecord::Base
	has_many :restaurant_themes
	has_many :restaurant, :through => :restaurant_themes
	has_many :pages, autosave: true
	has_many :layouts, autosave: true
	has_permalink :name

	validates_presence_of :name

	accepts_nested_attributes_for :pages, :layouts

	def self.standard
		Theme.find_by_name("standard") || Theme.create(ThemeLoader.load("standard"))
	end

	def save_page(name, body)
		page = pages.find{|p|p.name == name} || pages.build(name: name)
		page.body = body
		page.save
	end

	def save_layout(name, body)
		layout = layouts.find{|l|l.name == name} || layouts.build(name: name)
		layout.body = body
		layout.save		
	end
end
