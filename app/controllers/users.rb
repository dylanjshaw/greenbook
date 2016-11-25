get '/register' do
  erb :'users/new'
end

post '/users' do
  User.create(params[:user])
  redirect '/questions'
end

get "/users/login" do
	erb :"/users/login"
end

get "/login" do
	@user = User.find_by(email: params[:email])
	@password = params[:password]
	if @user
		if @user.authenticate(@password)
			session[:user_id] = @user.id
			redirect "/questions"
		else
			erb :"users/login"
		end
	else
		erb :"users/login"
	end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/questions'
end
