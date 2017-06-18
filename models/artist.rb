require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists ( name ) VALUES ('#{@name}') 
      RETURNING *;"
    new_artist = SqlRunner.run(sql)
    @id = new_artist.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id=#{id};"
    artist = SqlRunner.run(sql)
    result = Artist.new(artist.first)
    return result
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end


end