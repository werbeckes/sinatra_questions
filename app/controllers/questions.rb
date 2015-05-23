get '/users/:id/questions/new' do
  @user_id = session[:user_id]
  erb :"questions/new"
end

get '/users/:id/new_answers' do
  @user_id = session[:user_id]
  @questions = Question.where(user_id: @user_id).order(:created_at)
  erb :"questions/new_answer"
end

get '/users/:user_id/questions/:q_id/edit' do
  @question = Question.find(params[:q_id])
  @user_id = session[:user_id]
  erb :"questions/edit"
end

get '/users/:user_id/questions/:q_id' do
  @question = Question.find(params[:q_id])
  @user_id = session[:user_id]
  @answers = Answer.where(question: @question)
  erb :"questions/details"
end


post '/users/:id/questions' do
  question = Question.new(params[:question])
  if question.valid?
    question.save
    redirect "/users/#{session[:user_id]}"
  else
    #TODO error handling
  end
end

post '/users/:id/answers' do
  user = User.find(session[:user_id])
  params[:answers].each do |answer|
    question = Question.find(answer[0])
    Answer.create(question: question, user: user, value: answer[1])
  end
  redirect "/users/#{session[:user_id]}"
end

put '/users/:user_id/questions/:q_id' do
  question = Question.find(params[:q_id])
  question.update_attributes(text: params[:question])
  redirect "/users/#{session[:user_id]}/questions/#{question.id}"
end

delete '/users/:user_id/questions/:q_id' do
  question = Question.find(params[:q_id])
  question.destroy
  redirect "/users/#{session[:user_id]}"
end
