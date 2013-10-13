class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_filter :login_with_access_token

	private 
	def login_with_access_token
		return if params[:token].nil?
		user = User.find_by_single_access_token(params[:token])
		UserSession.create(user) if(user.present?)
	end
end
