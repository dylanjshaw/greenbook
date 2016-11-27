post'/votes' do
  params[:voter_id] = session[:user_id]
  search_data = {voteable_type: params[:voteable_type], voteable_id: params[:voteable_id], voter_id: session[:user_id]}
  puts search_data[:voteable_id]

  vote = Vote.find_by(search_data)
  question = Question.find(params[:voteable_id])


  if Answer.exists?(params[:voteable_id])
    answer = Answer.find(params[:voteable_id])

  end

  if vote
    vote.value = params[:value]
    vote.save
  else
    vote = Vote.create(params)
  end

  if request.xhr? && answer
   answer.count_votes.to_s
  elsif request.xhr? && question
    question.count_votes.to_s
  else
    redirect "/#{vote.voteable_type.downcase}s"
  end
end
