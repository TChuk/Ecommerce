class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def initialize_session
    session[:shopping_cart] ||= []
  end

  def increment_visit_count
    session[:shopping_cart] += 1
    @current_cart = session[:visit_count]
  end

  def all_systems
    System.all.map { |sys| [sys.name, sys.id] }
  end
  helper_method :all_systems
end
