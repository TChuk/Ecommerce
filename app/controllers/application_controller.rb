class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def all_systems
    System.all.map { |sys| [sys.name, sys.id] }
  end
  helper_method :all_systems
end
