class ApplicationController < ActionController::Base
  before_action :initialize_session
  protect_from_forgery with: :exception

  def current_order
    if !session[:order_id].nil?
      if Order.find_by_id(session[:order_id]).nil?
        Order.new
      else
        Order.find_by_id(session[:order_id])
      end
    else
      Order.new
    end
  end
  helper_method :current_order


  def current_customer
    if !session[:customer_id].nil?
      if Customer.find_by_id(session[:customer_id]).nil?
        Customer.new
      else
        Customer.find_by_id(session[:customer_id])
      end
    else
      Customer.new
    end
  end
  helper_method :current_customer

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

  def all_provinces
    Province.all.map { |prov| [prov.name, prov.id] }
  end
  helper_method :all_provinces

  def provinces
    Province.all
  end
  helper_method :provinces
  protected

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) do |u|
      #u.permit :username, :password
    #end
  #end

    private

    def initialize_session
      session[:cart] ||= []
      session[:user] ||= "guest"
    end
end
