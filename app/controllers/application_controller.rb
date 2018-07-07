class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user
	helper_method :current_user, :has_edit_permission?, :is_admin?, :is_banned

	def current_user
		@current_user ||= User.find(user_id) if user_id
	end

	private
	
	def has_edit_permission?
		if current_user != project.user
			flash.alert = 'Permission denied!!!'
			@current_user.update_attribute(:banned, true)
			redirect_to log_out_path
		end
	end

	def is_admin?
		@current_user.admin
	end
	
	def user_id
		session[:user_id]
	end

	def logged_in
		current_user.present?
	end

	def authenticate_user
		return if logged_in
		redirect_to new_session_path
	end

end