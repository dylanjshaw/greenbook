get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  if session[:user_id]
  @user = User.find(session[:user_id])
  end
  @question = Question.find(params[:id])
  erb :'questions/show'
end


put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update_attributes(title: params[:title], content: params[:content])
  redirect "/questions/#{@question.id}"
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.delete
  redirect '/questions'
end
