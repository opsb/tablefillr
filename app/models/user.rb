class User < ActiveRecord::Base
	belongs_to :restaurant

	validates_presence_of :first_name, :last_name

	acts_as_authentic do |config|
		config.require_password_confirmation = false
	end
end
