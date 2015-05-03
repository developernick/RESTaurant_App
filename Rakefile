# -_-_-_-_-_-_-_-_- Gems -_-_-_-_-_-_-_-_-
require 'bundler/setup'
Bundler.require

# -_-_-_-_-_-_-_-_- Connection -_-_-_-_-_-_-_-_-
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'pos_app'
)

# -_-_-_-_-_-_-_-_- Models -_-_-_-_-_-_-_-_-
require './models/party'
require './models/order'
require './models/food'
require './models/user'

namespace :db do

  desc 'Create Admin User'
  task :create_user do
    user = User.new(username: 'Buddy')
    user.password = Password.new(password: '0000')
    user.save!
  end

  desc 'Fill Database with Foods'
  task :food_data do

    food_start = ['New York', 'Chicago', 'Smoked', 'BBQ', 'Dry Aged']
    food_end = ['Steak', 'Venison', 'Bacon', 'Eggs', 'Fish(Game Only)']
    cuisines =['Meat', 'Game', 'BBQ' ]
    rand(5..15).times do
      Food.create({
        name: ( food_start.sample + ' ' + food_end.sample),
        cuisine: cuisines.sample,
        cents: rand(500..2000)
        })
      end
  end

  desc 'Fill Database with Parties'
  task :party_data do

      # Generate Parties
      rand(10..20).times do |num|
        Party.create({
          table_number: (num + 1),
          is_paid: [true, false, false].sample
        })
      end
  end

  desc 'Fill Database with Orders'
  task :orders_data do

      # Generate Orders
      parties = Party.all
      foods = Food.all
      rand(10..35).times do |num|
        Order.create({
        party_id: parties.sample,
        food_id: foods.sample
        })
        end
  end

  desc "Empty Database"
  task :empty do
    Order.destroy_all
    Food.destroy_all
    Party.destroy_all
  end # task :empty

end # namespace db end
