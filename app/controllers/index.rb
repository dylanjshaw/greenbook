post '/questions' do
  new_question = Question.create( params[:question].merge(author_id: session[:user_id]) )
  redirect "/questions/#{new_question.id}"
end

get '/questions/new' do
  erb :'questions/new'
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end
