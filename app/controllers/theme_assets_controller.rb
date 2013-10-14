class ThemeAssetsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def update
		theme = Theme.find_by_permalink(params[:theme_id])
		success = theme.save_asset(params[:id], params[:content])
		render :nothing => true, :status => (success ? 200 : 500)
	end
end
