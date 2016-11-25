post '/comment/:answer_id/:user_id' do
  params.merge(commentable_id: params[:answer_id], commentable_type: "Answer")
  @comment = Comment.create(params)
  erb :question
end
