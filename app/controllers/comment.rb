post '/comments' do
  @comment = Comment.create(commentable_id: params[:commentable_id], user_id: session[:user_id], commentable_type: "Answer", content: params[:content])
  redirect "/questions/#{params[:question_id]}"
end
