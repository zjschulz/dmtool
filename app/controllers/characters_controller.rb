class CharactersController < ApplicationController
  
  #CREATE
  
    #NEW
    get '/characters/new' do
      erb :'characters/new'
    end
  
    #CREATE
    post '/characters' do
      @characters = Character.create(player_name: params[:player_name], campaign: params[:campaign], character_name: params[:character_name], character_class: params[:character_class], armor_class: params[:armor_class], perception: params[:perception], investigation: params[:investigation], insight: params[:insight], spell_save_dc: params[:spell_save_dc])
      @characters.save
      redirect "/characters/#{@characters.id}"
    end
    
  #READ
  
    #INDEX
    get '/characters' do
      @characters = Character.all
      erb :'characters/index'
    end
    
    #SHOW
    get '/characters/:id' do
      @characters = Character.find(params[:id])
      erb :'characters/show'
    end
  
  #UPDATE
  
    #EDIT
    #get request to /characters/:id/edit
    get '/characters/:id/edit' do
      @characters = Character.find(params[:id])
      erb :'characters/edit'
    end
    
    #UPDATE
    #patch request to /characters/:id
    patch '/articles/:id' do 
    #will find the instance of the model to update, using the id from params, update and save that instance.
      character = Article.find(params[:id])
      character.player_name = params["player_name"] unless params["player_name"].empty?
      character.campaign = params["campaign"] unless params["campaign"].empty?
      character.character_name = params["character_name"] unless params["character_name"].empty?
      character.character_class = params["character_class"] unless params["character_class"].empty?
      character.armor_class = params["armor_class"] unless params["armor_class"].empty?
      character.perception = params["perception"] unless params["perception"].empty?
      character.investigation = params["investigation"] unless params["investigation"].empty?
      character.insight = params["insight"] unless params["insight"].empty?
      character.spell_save_dc = params["spell_save_dc"] unless params["spell_save_dc"].empty?
      character.save
      character.update
    end
  
  #DELETE
  
    #delete request to /characters/:id
    
end