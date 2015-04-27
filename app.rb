require 'bundler'
Bundler.require()
# -------------Connection-------------
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'pos_app'
)

# -------------Models-------------
require './models/party'
require './models/order'
require './models/food'


# -------------Helper?-------------
# def food_parameters
#   request_body = JSON.parse(request.body.read.to_s)#Replaces content_type :json
#   { title: request_body["title"], message: request_body["message"] }
# end
#
# def party_parameters
#   request_body = JSON.parse(request.body.read.to_s)#Replaces content_type :json
#   { title: request_body["title"], message: request_body["message"] }
# end
# -------------Routes-------------

get '/' do
  erb :index
end

get '/api/foods' do
  content_type :json
  Food.all.to_json
end

get '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  content_type :json
  food.to_json
end

post '/api/foods' do
  food = Food.new(params[:food])
  content_type :json
  food.to_json
end

patch '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  food.update(params[:food])
  content_type :json
  food.to_json
end

put '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  food.update(params[:food])
  content_type :json
  food.to_json
end

delete '/api/foods/:id' do
  Food.delete(params[:id].to_i)
  content_type :json
  {message: "Food item has been removed."}.to_json
end

get '/api/parties' do
  content_type :json
  Party.all.to_json
end

get '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  content_type :json
  party.to_json
end

post '/api/parties' do
  party = Party.new(params[:party])
  content_type :json
  party.to_json
end

patch '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  party.update(params[:party])
  content_type :json
  party.to_json
end

put '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  party.update(params[:party])
  content_type :json
  party.to_json
end

delete '/api/parties/:id' do
  content_type :json
  party = Party.find(params[:id].to_i)
  {message: "Party has been removed."}.to_json
end

post '/api/orders' do
  content_type :json
  order = Order.new(params[:order])
  order.to_json
end

patch '/api/orders/:id' do
  content_type :json
  order = Order.find(params[:id].to_i)
  order.update(params[:order])
  order.to_json
end

delete '/api/orders/:id' do
  content_type :json
  Order.delete(params[:id].to_i)
  {message: "Order has been removed"}
end

get '/api/:id/reciept' do
  content_type :json
  Reciept.all.to_json
end

patch '/api/:id/checkout' do
  content_type :json
  checkout = Checkout.find(params[:id].to_i)
  checkout.update(params[:checkout])
  checkout.to_json
end

put '/api/:id/checkout' do
  content_type :json
  checkout = Checkout.new(params[:checkout])
  checkout.to_json
end
