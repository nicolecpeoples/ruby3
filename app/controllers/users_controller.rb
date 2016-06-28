class UsersController < ApplicationController
include SessionsHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def edit
  end

  def create

  	if params[:user][:lender] == 'true'
  		@lender = User.new(user_params)
  		if @lender.save
	  		log_in @lender
	  		redirect_to lender_path(current_user)
	  	else
        @borrower = User.new
	  		render 'registrations/index'
	  	end
  	else
  		@borrower = User.new(user_params)

  		if @borrower.save
  			log_in @borrower
  			redirect_to borrower_path(current_user)
  		
	  	else 
        @lender = User.new
			 render 'registrations/index'
	  	end
  	end
  end 

  def update
  	
  	if @user.update_attributes(user_params)
  		flash[:success] ="Profile Updated"
  		redirect_to @user
  	else
  		render @user
  	end
  end

  def show
  	@user = User.find(params[:id])
        
  end

  def destroy
  	destroy_user
    flash[:success] = "Your account has been successfully deleted"
    redirect_to login_path
  end 

  private
   def set_user
   	 @user = User.find(params[:id])
   end 

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email,:password, :password_confirmation, :money, :request, :description, :lender, :amount_raised)
  end
end
