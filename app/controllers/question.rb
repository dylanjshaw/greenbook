get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  if session[:user_id]
  @user = User.find(session[:user_id])
  end
  @question = Question.find(params[:id])
  @question_comments = @question.comments
  @answers = @question.answers
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
