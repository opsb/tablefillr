class ThemeAssetsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def update
		success = theme.save_asset(params[:id], params[:content])
		render :nothing => true, :status => (success ? 200 : 500)
	end

	def destroy
		success = theme.delete_asset(params[:id])
		render :nothing => true, :status => (success ? 200 : 500)
	end

	def theme
		@theme ||= Theme.includes(:layouts).find_by_permalink(params[:theme_id])
	end
end
