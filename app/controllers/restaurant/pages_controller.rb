class Restaurant::PagesController < ApplicationController
	def show
		restaurant = Restaurant.find_by_subdomain!(request.subdomain)
		template = Liquid::Template.parse(restaurant.theme["#{params[:page]}_page"])
		render :text => template.render, :content_type => :html
	end	
end
