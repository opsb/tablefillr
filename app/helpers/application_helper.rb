module ApplicationHelper
	def page_class
		"page#{request.path.gsub(/\W/, "-")}".gsub(/^page-$/, "page-home")
	end
end
