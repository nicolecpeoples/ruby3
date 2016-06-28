class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :loan,
  class_name: "User"
end
