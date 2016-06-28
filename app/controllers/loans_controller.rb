class LoansController < ApplicationController
include SessionsHelper

	def update
		if (current_user.money - (params[:user][:money]).to_i) >=0
			@borrower = User.find(params[:user][:user_id])
			@connection = Loan.create(user: current_user, loan: User.find(params[:user][:user_id]), amount_loaned: params[:user][:money])
			if @connection.save
				current_user.update_attributes(money: (current_user.money - @connection.amount_loaned))
				@borrower.update_attributes(amount_raised: @borrower.amount_raised + @connection.amount_loaned)
				redirect_to lender_path(current_user)

			end
		else
			flash[:danger] = "Insufficient Funds"
			redirect_to lender_path(current_user)
		end
	end

	private 

		def user_params
			params.require(:user).permit(:money, :amount_raised)
		end
end
