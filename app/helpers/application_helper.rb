module ApplicationHelper
	def page_class
		"page#{request.path.gsub(/\W/, "-")}"
	end
end
