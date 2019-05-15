class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
	    if user && user[:password] == params[:session][:password]
	      	log_inn user
      		redirect_to users_url
	    else
	      	flash.now[:error] = "Invalid email/password combination."
	      	render 'new'
		end
	end

	def destroy
	    session.delete(:id)
	    current_user = nil
	    redirect_to "http://localhost:3000/users/sign_in"
	    
	end	

end
