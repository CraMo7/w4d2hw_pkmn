require_relative('../models/pokemon.rb')
require_relative('../models/trainer.rb')
require_relative("../models/owned_pokemon.rb")

get '/owned_pokemon' do
  #INDEX
  @owned_pokemon = Trainer.all()
  erb :"owned_pokemon/index"
end

get '/owned_pokemon/new' do
  #NEW
  erb :"owned_pokemon/new"
end

get '/owned_pokemon/:id' do
  #SHOW
  @trainer = Trainer.find(params[:id])
  erb :"owned_pokemon/show"
end

get '/owned_pokemon/edit' do
  #EDIT
  erb :"owned_pokemon/edit"
end

post '/owned_pokemon' do
  #CREATE
  @trainer = Trainer.new( params )
  @trainer.save()
  redirect to("/owned_pokemon")
end

post '/owned_pokemon/:id' do
  #UPDATE
end

post '/owned_pokemon/:id/delete' do
  #DESTROY
end