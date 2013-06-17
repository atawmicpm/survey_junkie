require 'debugger'
get '/surveys/new' do
  # crazy ajax/jquery shit
  erb :create_survey
end

post '/surveys/:id' do
  user = current_user
  user.choices << Choice.find(params[:id])
  if !user.valid?
    @errors=user.errors
    erb :take_survey # error listing is in layout.erb
  else
    erb :thank_you
  end
end

post '/surveys' do
  survey = Survey.publish(current_user.id, params)
  redirect "/surveys/#{survey.id}"
end

get '/surveys/:id' do
  # note: need to deal with the case where a creator with a valid
  # session responds to a survey responder URL
  unless authenticated?
    @messages = {:error => "Please log in first" }
    erb :'sessions/sign_in'
    redirect '/sessions/new'
  end

  @survey=Survey.find(params[:id])
  if current_user == @survey.user
    @results = @survey.report
    erb :survey_results
  elsif
    erb :take_survey
  end
end

get 'surveys/thank-you' do
  # static thank you page + create your own survey button
  erb :thank_you
end

get '/surveys/:id/quick_report' do 
  survey = Survey.find(params[:id])
  erb :'_quick_result', :locals => { survey: survey }, :layout => false
end

get '/surveys/:id/report' do 
  survey = Survey.find(params[:id])
  survey.graph_report.to_json
end
