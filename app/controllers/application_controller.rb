class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  protect_from_forgery with: :exception

  def all_systems
    System.all.map { |sys| [sys.name, sys.id] }
  end
  helper_method :all_systems

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :username, :password
      end
    end

    private

    def initialize_session
      session[:cart] ||= []
      session[:user] ||= "guest"
    end
end
