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
  erb (:inventory)
end

get '/order' do
  erb (:order)
end

