get '/users/new' do
  # render sign-up page
  erb :sign_up
end

get '/user/:id' do
  user = User.find(params[:id])
  erb :'users/show', :locals => {user: user}
end

before '/users/:id/edit' do 
  unless authenticated?
    redirect '/'
    @messages = "Sorry you need to log in to get there"
  end
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :edit_user
end

post '/users' do
  user = User.new(:name => params[:user][:name], :email => params[:user][:email], :password_hash => params[:user][:password])
  if user.save 
    log_in_user(user)
    redirect '/'
  else
    @messages = user.errors.messages
    erb :sign_up
  end
end
