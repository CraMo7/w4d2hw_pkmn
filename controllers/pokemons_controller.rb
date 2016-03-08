require_relative('../models/pokemon.rb')
require_relative('../models/trainer.rb')

get '/pokemons' do
  #INDEX
  @pokemons = Pokemon.all()
  erb :"pokemons/index"
end

get '/pokemons/new' do
  #NEW
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  #SHOW
  erb :"pokemons/show"
end

get '/pokemons/edit' do
  #EDIT
  erb :"pokemons/edit"
end

post '/pokemons' do
  #CREATE
  @pokemon = Pokemon.new( params )
  @pokemon.save()
  redirect to("/pokemons")
end

post '/pokemons/:id' do
  #UPDATE
end

post '/pokemons/:id/delete' do
  #DESTROY
end