post '/comments' do

  @comment = Comment.create(params.merge(user_id: session[:user_id]))
  redirect "/questions/#{@comment.question_id}"
end
