require_relative('../db/sql_runner')
require('pry')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :quantity

  def initialize(options) 
    @id = options['id'].to_i
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (title, quantity, artist_id ) VALUES ('#{@title}', #{@quantity}, #{@artist_id}) 
      RETURNING *;"
    new_album = SqlRunner.run(sql)
    @id = new_album.first()['id'].to_i
  end

  def artist_name() 
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)[0]
    artist = Artist.new(result)
    return artist.name
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new(album) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id=#{id};"
    album = SqlRunner.run(sql)
    result = Album.new(album.first)
    return result
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    SqlRunner.run( sql )
  end

# binding.pry


end