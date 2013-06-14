get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  unless authenticated?
    @user = User.find_by_email(params[:email])
    if User.authenticate(params[:email], params[:password])
      log_in_user(@user)
      erb :index
    else
      @messages = {:error => "Incorrect username or password" }
      erb :sign_in
    end
  end 
end

get '/logout' do
  session.clear
  erb :index
end
