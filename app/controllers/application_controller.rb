class ApplicationController < ActionController::Base
	before_action :require_login 

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def loggedin?
		session[:user_id].present?
	end

	private

	def require_login
		unless loggedin?
			redirect_to sign_in_path
		end
	end

end

