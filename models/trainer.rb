require( 'pg' )
require_relative('pokemon')
require_relative('../db/sql_runner')


class Trainer

  attr_reader( :id, :email,:name )

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO Trainers (name) VALUES ('#{ @name }')"
    SqlRunner.run_sql( sql )
    return last_entry()
  end

  def self.find(id)
   sql = "SELECT * FROM Trainers WHERE id = #{id.to_i}"
   result = SqlRunner.run_sql( sql )
   trainer = Trainer.new( result[0] )
  end

  def last_entry
    sql = "SELECT * FROM Trainers ORDER BY id DESC limit 1;"
    return Trainer.map_item(sql)
  end

  def pokemon()
    sql = "SELECT p.* FROM Pokemons p INNER JOIN OwnedPokemons o ON o.pokemon_id = p.id WHERE o.trainer_id = #{@id};"
    return Pokemon.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM Trainers"
    return Trainer.map_items(sql)
  end

  def self.delete_all 
   sql = "DELETE FROM Trainers"
   SqlRunner.run_sql(sql)
  end

  def self.map_items(sql)
    trainers = SqlRunner.run_sql( sql )
    result = trainers.map { |t| Trainer.new( t ) }
    return result
  end

  def self.map_item(sql)
    result = Trainer.map_items(sql)
    return result.first
  end

end