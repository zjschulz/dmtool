class CharactersController < ApplicationController
  
  #CREATE
  
    #NEW
    #get request to '/'
  
    #CREATE
    #post request to /characters
    
  #READ
  
    #INDEX
    #get request to /characters
    get '/characters' do
      erb :'characters/index'
    end
    
    #SHOW
    #get request to /characters/:id
  
  #UPDATE
  
    #EDIT
    #get request to /characters/:id/edit
    
    #UPDATE
    #patch request to /characters/:id
  
  #DELETE
  
    #delete request to /characters/:id
  
end