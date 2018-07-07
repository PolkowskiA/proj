class SessionsController < ApplicationController
	skip_before_action :authenticate_user, only: [:new, :create]
	before_action :current_user

	def new
	end

	def create

		user = User.find_by_email(params[:email])&.authenticate(params[:password])
		if user
			session[:user_id] = user.id
			current_user
			# binding.pry
			if is_banned
				destroy
				flash[:error] = "This account has been suspended" 
			else
				redirect_to root_url, notice: 'Logged in!'
			end
		else
			flash.now.alert = 'Invalid email or password'
			render :new
		end

	end

	def destroy
		session.delete(:user_id)
		redirect_to root_url, notice: 'Logged out!'
	end

	private

	def is_banned
		@current_user.present? && @current_user.banned
	end

end