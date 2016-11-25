post '/vote/:answer_id/:user_id' do
  answer = Answer.find(params[:answer_id])
  params[:name] == "Upvote" ? value = 1 : value = -1
  answer.votes.create(voteable_id: [:answer_id], voteable_type: "Answer", voter_id: params[:user_id], value: value)
  redirect "questions/#{session[:question_id]}"
end

post '/vote/:question.id/:user.id' do
  question = Question.find(params[:question_id])
  params[:name] == "Upvote" ? value = 1 : value = -1
  question.votes.create(voteable_id: [:question_id], voteable_type: "Question", voter_id: params[:user_id], value)
  redirect "questions/#{session[:question_id]}"
end
