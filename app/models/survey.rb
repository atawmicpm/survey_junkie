class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  def publish(user_id, survey_name, questions, choices)

  end
  
end
