class Theme < ActiveRecord::Base
	has_many :restaurant_themes
	has_many :restaurant, :through => :restaurant_themes
	has_many :pages, autosave: true
	has_many :layouts, autosave: true
	has_many :assets, autosave: true
	has_permalink :name

	validates_presence_of :name

	accepts_nested_attributes_for :pages, :layouts

	def self.standard
		Theme.find_by_name("standard") || Theme.create(ThemeLoader.load("standard"))
	end

	def save_page(name, content)
		page = pages.find{|p|p.name == name} || pages.build(name: name)
		page.content = content
		page.save
	end

	def save_layout(name, content)
		layout = layouts.find{|l|l.name == name} || layouts.build(name: name)
		layout.content = content
		layout.save		
	end

	def save_asset(name, content)
		asset = assets.find{|a|a.name == name} || assets.build(name: name)
		asset.content = content
		asset.save
	end
end
