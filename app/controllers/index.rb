get '/' do
  if authenticated?
    erb :'users/show', :locals => { user: current_user }
  else
    erb :index
  end
end
