require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# creator
user = User.create(:username => "user", :email => "joe@fred.com", :password_digest => "password")
survey = Survey.create(:name => "First Survey")
user.surveys << survey
question = Question.create(:name => "What is your name?")
survey.questions << question
choice1 = Choice.create(:name => "fred")
choice2 = Choice.create(:name => "mary")
question.choices << choice1
question.choices << choice2

# creator as responder
user.choices << choice1 # creates entry in answers table

# responder
user2 = User.create(:username => "mary", :email => "mary@fred.com", :password_digest => "password")
user2.choices << choice2
