class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])
	    if user && user[:password] == params[:session][:password]
	      	log_inn user
      		redirect_to root_url
	
	    else
	      	flash.now[:error] = "Invalid email/password combination."
	      	render 'new'
		end
	end

	def destroy

		for i in Session.all:
			if i[:user_id] == user_id
			    session.delete(i[:id])
			    @current_user = nil
			    redirect_to "http://localhost:3000/log_in"
	    
	end	

end
