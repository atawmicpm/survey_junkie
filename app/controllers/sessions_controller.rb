get '/sessions/new' do
  # render sign-in page 
  erb :'sessions/sign_in'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if User.authenticate(params[:email], params[:password])
    log_in_user(@user)
    erb :'users/show', :locals => {:user => @user}
  else
    @messages = {:error => "Incorrect username or password" }
    erb :'sessions/sign_in'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
