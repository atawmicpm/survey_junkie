require 'bcrypt'
require 'validates_email_format_of'

class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
  has_many :answers
  has_many :choices, :through => :answers

  validates_uniqueness_of :username, :email
  validates_presence_of   :username, :email
  validates_email_format_of :email

  private

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user
      db_pass = Password.new(user.password_hash)
      db_pass == password
    else
      false
    end
  end

  def encrypt_password
    password = Password.create(self.password_hash)
    self.password_hash = password
  end
end
