class RegistrationsController < ApplicationController

  def index
  	@lender = User.new
  	@borrower = User.new

  end
end
