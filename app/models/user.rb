class User < ActiveRecord::Base
	has_secure_password
  #TODO : Use bcrypt to store hashed passwords and authenticate users
end
