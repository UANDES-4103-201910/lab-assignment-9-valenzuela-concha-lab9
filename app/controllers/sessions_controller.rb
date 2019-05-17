class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
	    if user
	      	log_inn user
	      	flash.now[:error] = "Logged"
      		redirect_to 'http://localhost:3000/users'
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
