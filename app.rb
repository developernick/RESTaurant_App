require 'bundler'
Bundler.require()
# -------------Connection-------------
ActiveRecord::Base.establish_connection(
  :adapter => 'postgreql'
  :database => 'restaurant'
)

# -------------Models-------------
require './models/party'
require './models/order'
require './models/food'

# -------------Helper-------------

# -------------Routes-------------

get '/' do
  erb :index
end

get '/api/foods' do

end

get '/api/foods/:id' do

end

get '/api/foods' do

end

get '/api/foods/:id' do

end

get '/api/foods/:id' do

end

get '/api/foods/:id' do

end

get '/api/parties' do

end

get '/api/parties/:id' do

end

get '/api/parties' do

end

get '/api/parties/:id' do

end

get '/api/parties/:id' do

end

get '/api/parties/:id' do

end

get '/api/orders' do

end

get '/api/orders/:id' do

end

get '/api/orders/:id' do

end

get '/api/:id/reciept' do

end

get '/api/:id/checkout' do

end

get '/api/:id/checkout' do

end
