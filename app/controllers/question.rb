get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :question
end
