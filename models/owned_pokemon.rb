require( 'pg' )
require_relative("../db/sql_runner.rb")
class OwnedPokemon

  attr_reader :id, :trainer_id, :pokemon_id

  def initialize( options )
    @id = options['id'].to_i
    @trainer_id = options['trainer_id'].to_i
    @pokemon_id = options['pokemon_id'].to_i
  end

  def save
    query = "INSERT INTO OwnedPokemons (
      trainer_id,
      pokemon_id) 
      VALUES (
        #{ @trainer_id }, 
        #{ @pokemon_id }
      )"
    Sql.run( query )
  end

  def self.all()
    query = "SELECT * FROM OwnedPokemons"
    owned = Sql.run( query )
    result = owned.map { |o| OwnedPokemon.new( o ) }
    return result
  end

  def self.delete_all 
    query = "DELETE FROM OwnedPokemons"
    Sql.run(query)
  end
  
end