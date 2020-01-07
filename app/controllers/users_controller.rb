class UsersController < ApplicationController
  
  #Users sign up 
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/signup' do
  user = User.new(params)
    if user.username.empty? || user.password.empty?
      @error = "Username and Password cannot be blank"
      erb :'users/signup'
    else
      user.save
      redirect '/characters'
    end
  end
  
  #Users delete account
  
end