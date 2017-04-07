class UsersController < ApplicationController
  #before_action :check_code, only: :create

  def create
    @user = User.new(:username => params[:username], :password => params[:password])
    @user.save
    #sign_in :user
    redirect_back(fallback_location: root_path)
  end

  def new
    @user = User.new
  end

  def check_code
    #unless User.find
  end

end
