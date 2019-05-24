class TicketsController < ApplicationController


	def index
		@tickets = if params[:description]
	    Ticket.where('description LIKE ?', "%#{params[:description]}%")
	  else
	    Ticket.all
	  end
	end


	def show
		@ticket = Ticket.find(params[:id])
	end

	def new
	end

	def edit
		@ticket = Ticket.find(params[:id])
	end

	def create

		@ticket = Ticket.new(ticket_params)

		if @ticket.save
			redirect_to @ticket
		else
			render 'new'
		end
	end

	def update
		@ticket = Ticket.find(params[:id])

		if @ticket.update(ticket_params)
			redirect_to @ticket
		else
			render 'edit'
		end
	end

	def destroy
    	@ticket = Ticket.find(params[:id])
    	@ticket.destroy
 
    	redirect_to tickets_path
  end


	private
		def ticket_params
			params.require(:ticket).permit(:description, :price, :event_id)
		end
end
