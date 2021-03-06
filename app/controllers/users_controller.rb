class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Sign Up successful"
      session[:user] = @user.username
      session[:user_id] = @user.id
      redirect_to(root_path, fallback_location: root_path)
    else
      session[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def authenticate
    @user = User.where(user_params).first
    #@password = User.select(:password).where(username_params).first
    if (@user.blank?)
      #session[:errors] = @user.errors.full_messages
      @user = User.new
      render :log_in
    else
      session[:user] = @user.username
      session[:user_id] = @user.id
      flash[:success] = "Sign In successful"
      redirect_to(root_path, fallback_location: root_path)
    end
  end

  def log_in
    @user = User.new
  end

  def log_out
    session[:user] = "guest"
    redirect_to(root_path, fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def username_params
    params.require(:user).permit(:username)
  end

  def password_params
  end

end
