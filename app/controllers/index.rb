enable :sessions

get '/' do
	@users = User.all if current_user
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
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

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
	user = User.create(params[:user])
	session[:user_id] = user.id if user
	redirect '/'
end
