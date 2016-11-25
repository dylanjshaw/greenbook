get '/' do
  redirect '/posts'
end

get '/posts' do
  @posts = Post.all
  erb :index
end

post '/posts/:id/vote' do
  post = Post.find(params[:id])
  post.votes.create(value: 1)
  redirect "/posts"
end

delete '/posts/:id' do
  # write logic for deleting posts here.
end

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

get '/register' do
  erb :'users/new'
end

