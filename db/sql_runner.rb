class Sql

  def self.run(query)
    begin
      db = PG.connect({ dbname: 'pokemon', host: 'localhost' })
      result = db.exec(query)
    ensure
      db.close
    end
    return result
  end

end