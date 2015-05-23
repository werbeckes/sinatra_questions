get '/users/login' do
  erb :"users/login"
end

get '/users/new' do
  erb :"users/create_user"
end

get '/users/logout' do
  session.clear
  redirect '/index'
end

get '/users/:id' do
  redirect '/' unless params[:id].to_i == session[:user_id]
  @user = User.find(session[:user_id])
  @questions = Question.where(user: @user).order(:created_at)
  erb :"users/home"
end



post '/users' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    user.errors.full_messages
    #TODO display errors to user
  end
end

post '/session/login' do
  if user_id = User.authenticate(params[:user])
    session[:user_id] = user_id
    redirect "/users/#{user_id}"
  else
    #TODO display login error to user
  end
end
