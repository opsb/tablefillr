class ThemeLayoutsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def update
		theme = Theme.includes(:layouts).find_by_permalink(params[:theme_id])
		success = theme.save_layout(params[:id], params[:body].read)
		render :nothing => true, :status => (theme.save ? 200 : 500)
	end
end
