class CharactersController < ApplicationController
  
  #CREATE
  
  #NEW
  get '/characters/new' do
    if logged_in?
      erb :'characters/new'
    else
      redirect :'/login'
    end 
  end
  
  #CREATE
  post '/characters' do
    @characters = current_user.characters.create(player_name: params[:player_name], campaign: params[:campaign], character_name: params[:character_name], character_class: params[:character_class], armor_class: params[:armor_class], perception: params[:perception], investigation: params[:investigation], insight: params[:insight], spell_save_dc: params[:spell_save_dc])
    @characters.save
    redirect "/characters/#{@characters.id}"
  end
    
  #READ
  
  #INDEX
  get '/characters' do
    if logged_in?
      @characters = Character.all
      erb :'characters/index'
    else
      redirect :'/login'
    end
  end
    
  #SHOW
  get '/characters/:id' do
    if logged_in?
      @character = Character.find(params[:id])
      erb :'characters/show'
    else
      redirect :'/login'
    end  
  end
  
  #UPDATE
  
  #EDIT
  get '/characters/:id/edit' do
    if logged_in?
      @character = Character.find(params[:id])
      erb :'characters/edit'
    else
      redirect :'/login'
    end  
  end
    
  #UPDATE
  patch '/characters/:id' do 
    character = Character.find(params[:id])
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
    redirect '/characters'
  end
  
  #DELETE
  
  delete '/characters/:id' do
    character = Character.find(params[:id])
    character.destroy
    redirect '/characters'
  end
    
end