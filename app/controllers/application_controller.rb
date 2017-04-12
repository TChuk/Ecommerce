class ApplicationController < ActionController::Base
  before_action :initialize_session
  protect_from_forgery with: :exception

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  helper_method :current_order


  def current_user
    if !session[:user_id].nil?
      User.find(session[:user_id])
    else
      Customer.new
    end
  end
  helper_method :current_user

  def all_systems
    System.all.map { |sys| [sys.name, sys.id] }
  end
  helper_method :all_systems

  def systems
    System.all
  end
  helper_method :systems

  def categories
    Category.all
  end
  helper_method :categories
  protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) do |u|
      #u.permit :username, :password
    #end
  #end

    private

    def initialize_session
      session[:order_id] = 2
      session[:cart] ||= []
      session[:user] ||= "guest"
    end
end
