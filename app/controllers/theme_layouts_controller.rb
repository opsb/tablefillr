class ThemeLayoutsController < ApplicationController
	def update
		theme = Theme.find_by_permalink(params[:theme_id])
		layout = theme.layouts.where(name: params[:id]).first || theme.layouts.build(name: params[:id])
		layout.body = params[:body].read

		render :nothing => true, :status => (theme.save ? 200 : 500)
	end
end
