require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

# INDEX
get '/' do
  erb(:index)
end

get '/inventory' do
  @albums = Album.all
  @artists = Artist.all
  erb (:inventory)
end

get '/order' do
  @albums = Album.all
  @artists = Artist.all
  erb (:order)
end

post '/order/album' do
  @albums = Album.all
  erb (:order)
end

