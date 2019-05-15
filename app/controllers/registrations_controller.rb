class RegistrationsController < ApplicationController
	def new
    	@user = User.new	
	end

	def create
	    @user = User.new(registration_params)
	    if @user.save(registration_params)
	    	flash[:success] = "Successfully created."
	    	redirect_to root_url
	    else
	    	flash.now[:error] = "Cannot create this user."
	    	render :new
	    end
	end

	private
	    def registration_params
	      params.require(:registrations).permit(:name, :email, :password, :phone)
	    end

end
