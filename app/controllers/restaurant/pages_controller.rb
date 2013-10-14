class Restaurant::PagesController < ApplicationController
	def show
		restaurant = Restaurant.find_by_subdomain!(request.subdomain)
		page = restaurant.theme.pages.find_by_name!(params[:page])

		page_template = Liquid::Template.parse(page.content)
		layout_template = Liquid::Template.parse(restaurant.theme.layouts.main.content)

		context = { 'theme' => restaurant.theme }

		content_for_layout = page_template.render(context)
		layout_with_content = layout_template.render(context.merge('content_for_layout' => content_for_layout))

		render :text => layout_with_content, :content_type => :html
	end
end
