class ShoppingBagsController < ApplicationController

	def new
	end

	def index 
		@shopping_bag = []

		for t in ShoppingBag.all
			ut = UserTicket.find(t.user_ticket)
			if ut.user_id == User.find(session["warden.user.user.key"][0][0]).id
				@shopping_bag << t
			end
		end
	end

end
