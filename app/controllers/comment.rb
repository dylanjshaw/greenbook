post '/comment/:answer_id/:user_id' do
  @comment = Comment.create(content: params[:content], user_id: params[:user_id], commentable_id: params[:answer_id], commentable_type: "Answer")
  redirect "/questions/#{@comment.question_id}"
end
