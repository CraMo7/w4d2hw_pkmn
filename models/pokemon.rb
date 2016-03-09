require( 'pg' )
require_relative('trainer')
require_relative('../db/sql_runner')

class Pokemon 

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end

  def save()
    query = "INSERT INTO Pokemons (name) VALUES ('#{ @name }') RETURNING *"
    result = query.run(query)
    @id = result[0]["id"]
  end

  def trainers()
    query = "SELECT t.* FROM Trainers u INNER JOIN OwnedPokemons o ON o.trainer_id = t.id WHERE o.pokemon_id = #{@id};"
    return Trainer.map_items(query)
  end

  def self.all()
    query = "SELECT * FROM Pokemons"
    return Pokemon.map_items(query)
  end

  def self.delete_all 
    query = "DELETE FROM Pokemons"
    Sql.run(query)
  end

  def self.map_items(query)
    pokemon = Sql.run(query)
    result = pokemon.map { |product| Pokemon.new( product ) }
    return result
  end

  def self.map_item(query)
    result = Pokemon.map_items(query)
    return result.first
  end

end