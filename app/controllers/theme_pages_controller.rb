class ThemePagesController < ApplicationController
	def update
		theme = Theme.find_by_permalink(params[:theme_id])
		page = theme.pages.where(name: params[:id]).first || theme.pages.build(name: params[:id])
		page.body = params[:body].read

		render :nothing => true, :status => (theme.save ? 200 : 500)
	end
end
