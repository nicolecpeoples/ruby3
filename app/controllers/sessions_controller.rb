class SessionsController < ApplicationController
	include SessionsHelper
	def create
		#check if user is in database
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user 
			if user.lender?
				redirect_to lender_path(current_user)
			else
				redirect_to borrower_path(current_user)
			end
		else
			flash[:danger] = 'Invalid email/password combination'
  			redirect_to registrations_url
		end
	end

	def destroy
		log_out if logged_in?
  		redirect_to registrations_url
	end
end
