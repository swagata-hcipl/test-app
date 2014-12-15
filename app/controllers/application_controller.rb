class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protected
  before_filter :set_cache_buster


  def authenticate_user
		if session[:user_id]
		# set current user object to @current_user object variable
			@current_user ||= User.find(session[:user_id])
			return true
		else
			redirect_to(:controller => 'session', :action => 'login')
			return false
		end
	end
  def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'session', :action => 'home')
			return false
		else
			return true
		end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  protect_from_forgery with: :exception
end
