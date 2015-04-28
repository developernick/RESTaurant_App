# app.rb is obsolite. make collections for all routes. move connections, gems, models to config.ru and add collection routes.

# Collections need a welcome collection to show index.erb

# build Session Collection to athenticate users that are allowed to make changes to the menu

# -_-_-_-_-_-_- Gems -_-_-_-_-_-_-_
require 'bundler/setup'
Bundler.require

# -_-_-_-_-_-_- Connection -_-_-_-_-_-_
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'pos_app'
)

# -_-_-_-_-_-_-Helpers-_-_-_-_-_-_-
require './helpers/session_helper'

# -_-_-_-_-_-_- Models -_-_-_-_-_-_
require './models/party'
require './models/order'
require './models/food'
require './models/user'

# -_-_-_-_-_-_- Controllers -_-_-_-_-_-_-
require './controllers/parties_controller'
require './controllers/orders_controller'
require './controllers/foods_controller'
require './controllers/sessions_controller'
require './controllers/welcome_controller'

# -_-_-_-_-_-_- Routes -_-_-_-_-_-_
map('/api/foods') {run FoodsController.new()}
map('/api/orders') {run OrdersController.new()}
map('/api/parties') {run PartiesController.new()}
map('/sessions') {run SessionsController.new()}

map('/') {run WelcomeController.new()}



get '/' do
  erb :index
end

get '/api/:id/reciept' do
  content_type :json
  Reciept.all.to_json
end
# -_-_-_-_-_-_-_- Checkout Routes -_-_-_-_-_-_-_-
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
