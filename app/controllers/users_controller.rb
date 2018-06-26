# frozen_string_literal: true
class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
    @users = User.all.order(:name)
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

  def is_admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end