post '/answer/:question_id' do
  @answer = Answer.create(content: params[:content], question_id: params[:question_id], user_id: session[:user_id])
  redirect "/questions/#{params[:question_id]}"
end
