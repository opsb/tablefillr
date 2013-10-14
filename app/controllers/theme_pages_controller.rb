class ThemePagesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def update
		theme = Theme.includes(:pages).find_by_permalink(params[:theme_id])
		success = theme.save_page(params[:id], params[:content].read)
		render :nothing => true, :status => (success ? 200 : 500)
	end
end
