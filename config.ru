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
