class Restaurant::PagesController < ApplicationController
	def show
		restaurant = Restaurant.find_by_subdomain!(request.subdomain)

		page_template = Liquid::Template.parse(restaurant.theme["#{params[:page]}_page"])
		layout_template = Liquid::Template.parse(restaurant.theme["layout"])

		layout_template.render("content_for_layout" => page_template.render)		
		content = layout_template.render("content_for_layout" => page_template.render)

		render :text => content, :content_type => :html
	end
end
