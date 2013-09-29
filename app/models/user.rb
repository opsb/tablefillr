class User < ActiveRecord::Base
	belongs_to :restaurant
	acts_as_authentic do |config|
		config.require_password_confirmation = false
	end
end
