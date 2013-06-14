get '/' do
  if current_user
    # profile page + button to create new survey + logout/profile in nav bar
    erb :profile
  else
    # marketing shit + sign up form + login drop-down in nav bar
    erb :index
  end
end

post '/users' do
  user = User.create(params[:user])
  session[:user_id] = user.id if user
  redirect '/'
end

post '/sessions' do
  user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  session[:user_id] = user.id if user
  redirect '/'
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end
