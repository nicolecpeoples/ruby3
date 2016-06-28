class BorrowersController < ApplicationController
	include SessionsHelper
	def show
		@user = User.find(params[:id])
		@lenders = Loan.where(loan: current_user)
	end
end
