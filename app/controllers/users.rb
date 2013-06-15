before '/user/:id' do 
  unless authenticated?
    redirect '/'
    @messages = "Sorry you need to log in to get there"
  end
end

before '/user/:id/edit' do 
  unless authenticated?
    erb :index
    @messages = "Sorry you need to log in to get there"
  end
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :'users/show', :locals => {:user => @user}
end

get '/user/:id/edit' do
  user = User.find(params[:id])
  erb :edit_user, :locals => { user: user }
end

get '/users/new' do
  erb :'users/sign_up'
end

post '/users' do
  user = User.new(params[:user])
  if user.save 
    log_in_user(user)
    erb :'users/show', :locals => { user: user }
  else
    @messages = user.errors.messages
    erb :'users/sign_up'
  end
end
