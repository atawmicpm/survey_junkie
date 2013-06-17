# require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.

# creator
user = User.create(:username => "foo", :email => "foo@bar.com", :password_digest => "password")
survey = Survey.create(:name => "Street Names")
user.surveys << survey

question = Question.create(:name => "Favorite Street Name for Methamphetamines?")
survey.questions << question
choice1 = Choice.create(:name => "beannies")
choice2 = Choice.create(:name => "speckled birds")
choice3 = Choice.create(:name => "granulated orange")
choice4 = Choice.create(:name => "blue devils")
choice5 = Choice.create(:name => "crystal")
question.choices << choice1
question.choices << choice2
question.choices << choice3
question.choices << choice4
question.choices << choice5

question = Question.create(:name => "Favorite Street Name for Steroids?")
survey.questions << question
choice1 = Choice.create(:name => "arnolds")
choice2 = Choice.create(:name => "gym candy")
choice3 = Choice.create(:name => "winstrol V")
choice4 = Choice.create(:name => "stackers")
choice5 = Choice.create(:name => "juice")
question.choices << choice1
question.choices << choice2
question.choices << choice3
question.choices << choice4
question.choices << choice5

question = Question.create(:name => "Favorite Street Name for PCP?")
survey.questions << question
choice1 = Choice.create(:name => "angel dust")
choice2 = Choice.create(:name => "Detroit pink")
choice3 = Choice.create(:name => "elephant tranquilizer")
choice4 = Choice.create(:name => "white horizon")
choice5 = Choice.create(:name => "zoom")
question.choices << choice1
question.choices << choice2
question.choices << choice3
question.choices << choice4
question.choices << choice5

question = Question.create(:name => "Favorite Street Name for Fentanyl?")
survey.questions << question
choice1 = Choice.create(:name => "dance fever")
choice2 = Choice.create(:name => "great bear")
choice3 = Choice.create(:name => "jackpot")
choice4 = Choice.create(:name => "goodfellas")
choice5 = Choice.create(:name => "murder 8")
question.choices << choice1
question.choices << choice2
question.choices << choice3
question.choices << choice4
question.choices << choice5

question = Question.create(:name => "Favorite Street Name for Ketamine?")
survey.questions << question
choice1 = Choice.create(:name => "cat valium")
choice2 = Choice.create(:name => "honey oil")
choice3 = Choice.create(:name => "special K")
choice4 = Choice.create(:name => "super acid")
choice5 = Choice.create(:name => "psychedelic heroin")
question.choices << choice1
question.choices << choice2
question.choices << choice3
question.choices << choice4
question.choices << choice5

# creator as responder
user.choices << choice1 # creates entry in answers table

# responder
user2 = User.create(:username => "baz", :email => "foo@baz.com", :password_digest => "password")
user2.choices << choice2
