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
  Question.create( title: params[:title],
               username: Faker::Internet.user_name,
               comment_count: rand(1000) )
  redirect '/questions'
end

get '/questions/:id' do
  @questions = Question.all
  @question = Question.find(params[:id])
  erb :index
end
