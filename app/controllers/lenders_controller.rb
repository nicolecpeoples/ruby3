class LendersController < ApplicationController
include SessionsHelper

	def show
		@users = User.all.where(lender: false)
		@user = User.find(params[:id])
		@lent_to = Loan.all.where(user: current_user).group("loan_id")
	end

end
