class User < ActiveRecord::Base
	has_secure_password

  has_many :surveys
  has_many :answers
  has_many :choices, :through => :answers

  #TODO : Use bcrypt to store hashed passwords and authenticate users
end
