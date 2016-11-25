get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @user = User.find(session[:user_id])
  erb :question
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(title: params[:title], content: params[:content])
  redirect '/questions/:id'
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.delete
  redirect '/'
end
