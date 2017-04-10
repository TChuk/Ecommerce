class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Sign Up successful"
      session[:user] = @user.username
      redirect_to(root_path, fallback_location: root_path)
    else
      session[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
