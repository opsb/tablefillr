class Restaurant < ActiveRecord::Base
	has_many :users
	has_one :restaurant_theme
	has_one :theme, :through => :restaurant_theme
	before_validation :assign_theme_if_missing

	has_permalink :name

	accepts_nested_attributes_for :users
	validates_presence_of :name, :address, :theme

	def subdomain
		permalink
	end

	def self.find_by_subdomain(subdomain)
		find_by_permalink(subdomain)
	end

	def self.find_by_subdomain!(subdomain)
		find_by_subdomain(subdomain) || (raise "No restaurant found under #{subdomain}")
	end

	private
	def assign_theme_if_missing
		self.theme = Theme.standard unless theme
	end
end
