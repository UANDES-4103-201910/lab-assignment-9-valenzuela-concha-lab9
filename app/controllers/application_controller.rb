class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	#complete this method
    if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
      end
  end

  def is_user_logged_in?
	#complete this method
  #	logged_in = false
	#if logged_in then true else redirect_to root_path end 
  end
end
