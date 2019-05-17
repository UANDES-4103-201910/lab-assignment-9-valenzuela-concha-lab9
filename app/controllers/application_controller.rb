class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include SessionsHelper


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
      unless logged_in?
        flash[:error] = "Please log in."
        redirect_to 'http://localhost:3000/users/sign_in'
      end
  end

end
