# frozen_string_literal: true
class UsersController < ApplicationController
	skip_before_action :authenticate_user, only: [:new, :create]
	helper_method :is_admin?

	def index
		@users = User.all.order(:name)
		if is_admin?
			@users
		else
			redirect_to users_path
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome_email(@user).deliver_now
			redirect_to new_session_path#, notice: 'Successfully signed up! You can log in now :)'
		else
			# flash[:notice] = "Something went wrong!"
			render :new
		end
	end

	private	

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end