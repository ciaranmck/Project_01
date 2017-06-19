require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all
Artist.delete_all


artist_01 = Artist.new({
  'name' => "Hiatus Kaiyote"
  })
artist_02 = Artist.new({
  'name' => "Todd Terje"
  })
artist_03 = Artist.new({
  'name' => "Anderson Paak"
  })

artist_01.save
artist_02.save
artist_03.save

album_01 = Album.new({
  'title' => "Choose Your Weapon",
  'quantity' => 50,
  'artist_id' => artist_01.id
  })
album_02 = Album.new({
  'title' => "Its Album Time", 'quantity' => 25,
  'artist_id' => artist_02.id
  })
album_03 = Album.new({
  'title' => "Malibu", 'quantity' => 75,
  'artist_id' => artist_03.id
  })

album_01.save
album_02.save
album_03.save



# binding.pry
# nil