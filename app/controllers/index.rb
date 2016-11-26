get '/' do
  redirect '/questions'
end

get '/questions' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @questions = Question.all
  erb :index
end

post '/questions' do
  new_question = Question.create( params[:question].merge(author_id: session[:user_id]) )
  redirect '/questions'
end

