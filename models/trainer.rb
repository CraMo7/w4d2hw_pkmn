require( 'pg' )
require_relative('pokemon')
require_relative('../db/sql_runner')


class Trainer

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end

  def save()
    query = "INSERT INTO Trainers (name) VALUES ('#{ @name }') RETURNING *"
    result = Sql.run(query)
    @id = result[0]["id"]
  end

  def self.find(id)
   query = "SELECT * FROM Trainers WHERE id = #{id.to_i}"
   result = Sql.run( query )
   trainer = Trainer.new( result[0] )
  end


  def pokemon()
    query = "SELECT p.* FROM Pokemons p INNER JOIN OwnedPokemons o ON o.pokemon_id = p.id WHERE o.trainer_id = #{@id};"
    return Pokemon.map_items(query)
  end

  def self.all()
    query = "SELECT * FROM Trainers"
    return Trainer.map_items(query)
  end

  def self.delete_all 
   query = "DELETE FROM Trainers"
   Sql.run(query)
  end

  def self.map_items(query)
    trainers = Sql.run(query)
    result = trainers.map { |t| Trainer.new( t ) }
    return result
  end

  def self.map_item(query)
    result = Trainer.map_items(query)
    return result.first
  end

end