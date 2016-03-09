require( 'sinatra' )
require( 'pry-byebug' )
require_relative('controllers/trainers_controller')
require_relative('controllers/pokemons_controller')
require 'sinatra/contrib/all' if development?

get '/' do
  erb :"home"
end