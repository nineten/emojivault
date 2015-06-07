class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def is_mobile?
		session[:mobile_override] = params[:mobile] if params[:mobile]
		mobile_device?
	end

	def mobile_device?
		if session[:mobile_override]
			session[:mobile_override] == "1"
		else
			(request.user_agent =~ /Mobile|webOS/)
		end
	end
	helper_method :mobile_device?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
	end
end
