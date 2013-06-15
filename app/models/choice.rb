class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  has_many :users, :through => :answers

	validates_presence_of   :name	
  # Remember to create a migration!
end
