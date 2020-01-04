class CharactersController < ApplicationController
  
  #CREATE
  
    #NEW
    #get request to '/'
    get 'characters/new'
      erb :'characters/new'
    end
  
    #CREATE
    #post request to /characters
    post '/characters' do
      @characters = Character.create(player_name: params[:player_name], campaign: params[:campaign], character_name: params[:character_name], character_class: params[:character_class], armor_class: params[:armor_class], perception: params[:perception], investigation: params[:investigation], insight: params[:insight], spell_save_dc: params[:spell_save_dc])
      @characters.save
      redirect "/characters/#{@characters.id}"
    end
    
  #READ
  
    #INDEX
    #shows all characters
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