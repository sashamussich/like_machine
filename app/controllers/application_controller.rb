class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
 	  @current_user || User.find(session[:user_id]) if session[:user_id]
    set_current_user #to be accessible from models to be able to pass ir to activejob class
  end

  helper_method :current_user

  def set_current_user
    User.current = current_user
  end

end
