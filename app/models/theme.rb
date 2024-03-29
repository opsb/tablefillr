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

	def delete_page(name)
		page = pages.find_by_name(name)
		page.destroy if page
	end

	def save_layout(name, content)
		layout = layouts.find{|l|l.name == name} || layouts.build(name: name)
		layout.content = content
		layout.save		
	end

	def delete_layout(name)
		layout = layouts.find_by_name(name)
		layout.destroy if layout
	end

	def save_asset(path, content)
		asset = assets.find{|a|a.path == path} || assets.build(path: path)
		asset.content = content
		asset.save
	end

	def delete_asset(path)
		asset = assets.find_by_path(path)
		asset.destroy if asset
	end
end
