#  post '/vote/answers/:answer_id/:user_id' do
#   answer = Answer.find(params[:answer_id])
#   params[:name] == "upvote" ? value = 1 : value = -1
#   answer.votes.create(voteable_id: [:answer_id], voteable_type: "Answer", voter_id: params[:user_id], value: value)
#   redirect "/questions"
# end

# post '/vote/questions/:question_id/:user_id' do
#   question = Question.find(params[:question_id])
#   Vote.create(voteable_id: question.id, voteable_type: "Question", voter_id: params[:user_id], value: params[:value].to_i)
#   redirect "/questions"
# end

post'/votes' do
  params[:voter_id] = session[:user_id]
  search_data = {voteable_type: params[:voteable_type], voteable_id: params[:voteable_id], voter_id: session[:user_id]}
  vote = Vote.find_by(search_data)
  question = Question.find(params[:voteable_id])

  if vote
    vote.value = params[:value]
    vote.save
  else
    vote = Vote.create(params)
  end

  if request.xhr?
   question.count_votes.to_s
  else
    redirect "/#{vote.voteable_type.downcase}s"
  end




  # params[:voter_id] = session[:user_id]
  # other_vote = Vote.find_by(params)

  # if !other_vote
  #   new_vote = Vote.create(params)
  #   params[:value] = params[:value].to_i * -1
  #   opposing_vote = Vote.find_by(params)

  # end

#   if !other_vote
#     new_vote = Vote.create(params)

#     params[:value] = (params[:value].to_i * -1).to_s

#     if opposing_vote = Vote.find_by(params)
#       opposing_vote.destroy
#     end

#     if request.xhr?
#       return new_vote.value.to_s
#     end
# else
#   # else
#   #   if request.xhr?
#   #     return "0"
#   #   # new_vote = other_vote
#   #   # if request.xhr?
#   #   #   if new_vote
#   #   #     return new_vote.value.to_s
#   #   #   else
#   #   #     return "0"
#   #   #   end
#   #   elsif new_vote
#   #     redirect "/#{new_vote.voteable_type.downcase}s"
#   #   else
#   #     redirect "/#{other_vote.voteable_type.downcase}s"
#   #   end
  # end


end
