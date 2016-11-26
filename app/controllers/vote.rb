 post '/vote/answers/:answer_id/:user_id' do
  answer = Answer.find(params[:answer_id])
  params[:name] == "upvote" ? value = 1 : value = -1
  answer.votes.create(voteable_id: [:answer_id], voteable_type: "Answer", voter_id: params[:user_id], value: value)
  redirect "/questions"
end

post '/vote/questions/:question_id/:user_id' do
  question = Question.find(params[:question_id])
  Vote.create(voteable_id: question.id, voteable_type: "Question", voter_id: params[:user_id], value: params[:value].to_i)
  redirect "/questions"
end

# post'/votes' do

# end
