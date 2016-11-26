post '/answer/:question_id' do
  @answer = Answer.create(content: params[:content], question_id: params[:question_id], user_id: session[:user_id])
  redirect "/questions/#{params[:question_id]}"
end

post '/answers' do
  params.merge(user_id: session[:user_id])
  @answer = Answer.create
  redirect "/questions/#{@answer.question_id}"
end

put '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(content: params[:content])
  redirect "/questions/#{@answer.question_id}"
end

delete '/answers/:answer_id' do
  answer_id = params[:answer_id]
  @answer = Answer.find(answer_id)
  question_id = @answer.question_id
  Answer.delete(answer_id)
  redirect "/questions/#{question_id}"

end
