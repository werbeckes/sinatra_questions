get '/' do
  redirect '/index'
end

get '/index' do
  erb :index
end

get '/home' do
  redirect "/users/#{session[:user_id]}"
end
