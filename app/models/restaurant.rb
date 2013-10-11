class Restaurant < ActiveRecord::Base
	has_many :users
	accepts_nested_attributes_for :users
	validates_presence_of :name, :address

	def subdomain
		permalink
	end
end
