class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  # Remember to create a migration!
end
