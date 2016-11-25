get '/questions/:id' do
  @user = User.find(session[:user_id])
  @question = Question.find(params[:id])
  @question_comments = @question.comments
  @answers = @question.answers
  @answer_comments = @answers.comments
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
  redirect '/questions'
end
