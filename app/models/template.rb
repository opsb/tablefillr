class Template < ActiveRecord::Base
	validates_presence_of :name, :content
	belongs_to :theme
end