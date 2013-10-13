class Template < ActiveRecord::Base
	validates_presence_of :name, :body
	belongs_to :theme
end