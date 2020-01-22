require './config/environment'

class ApplicationController < Sinatra::Base 
  
  configure do
    enable :sessions
    set :session_secret, "password_security"
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :welcome
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def redirect_if_logged_in
    if !logged_in?
      redirect :'/login'
    end 
  end
  
end