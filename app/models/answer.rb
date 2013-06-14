class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  # Remember to create a migration!
end
