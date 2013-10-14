class Asset < ActiveRecord::Base
	belongs_to :theme
	mount_uploader :content, AssetUploader
	validates_presence_of :content
end
