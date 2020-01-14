class SessionsController < ApplicationController

  get '/login' do
    erb :'users/login'
  end
  
  post '/login' do
    if params["username"].empty? || params["password"].empty?
      @error = "Username and Password cannot be blank. Please try again"
      erb :'users/login'
    else
      if user = User.find_by(username: params["username"], password: params["password"])
        session[:user_id] = user.id
        redirect '/characters'
      else
        @error = "Username or Password incorrect. Please try again."
        erb :'users/login'
      end
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end
  
end