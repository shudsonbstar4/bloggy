class MainController < ApplicationController
	def about_us
		#Goes to DB and retrieves list of forbidden words
		@words = ["Forking", "Dongle", "Stuff"]
		@my_name = "Sarah"
		@color = "red"
		
		name = params[:name]
		Rails.logger.info "Passed-in name = #{name}" #this allows for debugging; prints out to server log
	end
	
	def contact
	end
	
	def terms
	end
	
	def our_team
	
	end
	
	def vision
	end
	
end