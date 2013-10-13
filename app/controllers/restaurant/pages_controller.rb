class Restaurant::PagesController < ApplicationController
	def show
		restaurant = Restaurant.find_by_subdomain!(request.subdomain)

		page = restaurant.theme.pages.find_by_name!(params[:page])
		page_template = Liquid::Template.parse(page.body)
		layout_template = Liquid::Template.parse(restaurant.theme.layouts.main.body)

		layout_template.render("content_for_layout" => page_template.render)		
		content = layout_template.render("content_for_layout" => page_template.render)

		render :text => content, :content_type => :html
	end
end
