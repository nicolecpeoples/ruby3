class User < ActiveRecord::Base
 has_many :loans, :foreign_key => "user_id", :class_name => "Loan"
 has_many :borrowers, :through => :loans

  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2}
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :description, presence:true, allow_blank: true

end
