get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :index
end

# post '/questions/:id/vote' do
#   question = Question.find(params[:id])
#   question.votes.create(value: 1)
#   redirect "/questions"
# end

delete '/questions/:id' do
  # @questions = Question.all
  Question.delete(params[:id])
  if !request.xhr?
    erb :index
  end
end

post '/questions' do

  new_question = Question.create( params[:question].merge(author_id: session[:user_id]) )
  redirect "/questions/#{new_question.id}"
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @questions = Question.all
  @question = Question.find(params[:id])
  erb :index
end

get '/register' do
  erb :'users/new'
end

