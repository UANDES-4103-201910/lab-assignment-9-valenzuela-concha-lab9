class UserTicketsController < ApplicationController


	def index
		@user_tickets = UserTicket.all
	end


	def show
		@user_ticket = UserTicket.find(params[:id])
	end

	def new
	end

	def edit
		@user_ticket = UserTicket.find(params[:id])
	end

	def create

		puts "hola"
		puts params
		@ticket = Ticket.find(params[:id])
		@user_ticket = UserTicket.create(user_id: User.find(session["warden.user.user.key"][0][0]).id, ticket_id: @ticket.id)
		redirect_to @user_ticket
	end

	def update
		@user_ticket = UserTicket.find(params[:id])

		if @user_ticket.update(user_ticket_params)
			redirect_to @user_ticket
		else
			render 'edit'
		end
	end

	def destroy
    	@user_ticket = UserTicket.find(params[:id])
    	@user_ticket.destroy
 
    	redirect_to user_tickets_path
  end

  def index_shopping_bag 
		@shopping_bag = []

		for ut in UserTicket.all
			if ut.user_id == User.find(session["warden.user.user.key"][0][0]).id
				@shopping_bag << ut
			end
		end
  end


  def shopping
  	puts "hola"
	puts params
	@ticket = Ticket.find(params[:ticket_id])
	@user_ticket = UserTicket.create(user_id: User.find(session["warden.user.user.key"][0][0]).id, ticket_id: @ticket.id)
	redirect_to @user_ticket
  end


	private
		def user_ticket_params
			params.require(:user_ticket).permit(:ticket_id, :paid).merge(user_id: session["warden.user.user.key"][0][0])
		end
end
