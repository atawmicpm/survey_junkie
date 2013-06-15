get '/surveys/new' do
  # crazy ajax/jquery shit
  erb :create_survey
end

post '/surveys' do

  # this needs to be passed some sort of data structure for question and choices
  Survey.publish(current_user.id, params)

  redirect '/surveys/new'
  # create new survey
  # redirect to /surveys/id
end

get '/surveys/:id' do
  if # current user == survey creator
    erb :survey_results
  else
    erb :take_survey
  end
end

post '/surveys/:id' do
  # submit survey response
  # redirect to home page
end

get 'surveys/thank-you' do
  # static thank you page + create your own survey button
  erb :thank_you
end
