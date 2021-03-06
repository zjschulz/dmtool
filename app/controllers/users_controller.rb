class UsersController < ApplicationController
  
  #Users sign up 
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/signup' do
    user = User.new(params)
    if user.username.empty? || user.password.empty?
      @error = "Username and Password cannot be blank. Please try again"
      erb :'users/signup'
    elsif User.find_by(username: user.username)
      @error = "Username already exists. Please try another."
    else
      user.save
      session[:user_id] = user.id
      redirect 'characters'
    end
  end
  
end