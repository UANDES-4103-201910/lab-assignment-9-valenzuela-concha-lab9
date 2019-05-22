class SessionsController < ApplicationController
	
	def new
		if current_user
			redirect_to current_user

		end
		
		
	end

	def create
		user = User.where(email: user_params[:email]).first
		puts user.encrypted_password
		puts user_params[:password]
		if user.valid_password?(user_params[:password])
	      # Save the user ID in the session so it can be used in
	      # subsequent requests
	      session[:current_user_id] = user.id
	      puts session[:current_user_id]
	      flash[:notice] = "Successful Login"
	      puts "Hello"
	      redirect_to users_path
	    else
	    	flash[:error] = "Invalid credentials"
	    	redirect_to root_url
	    end
	end

	def destroy
		@current_user = session[:current_user_id] = nil
		if session["warden.user.user.key"]
			session["warden.user.user.key"][0][0] = 0
		end
    	redirect_to root_url
	end

	def user_params
      params.require(:session).permit(:email, :password)
    end

    def google_logged_in
      if session["warden.user.user.key"] then true else false end
    end
end
