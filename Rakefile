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

  desc 'Fill Database with Junk Data'
  task :junk_data do

    food_start = ['Thai', 'Chicago', 'Smoked', 'BBQ', 'Dry Aged']
    food_middle = ['Chicken', 'Steak', 'Salmon', 'Ahi Tuna', 'Lamb']
    food_end = ['Salad', 'Sandwhich', 'Entree', 'Fillet']
    cuisines =['Merikan', 'Italian', 'Greek', 'BBQ' ]
    rand(5..15)times do
      Food.create({
        name: ( food_start.sample + ' ' + food_middle.sample + ' ' + food_end.sample),
        cuisine: cuisines.sample,
        cents: rand(500..2000)
        })
      end

      # Generate Parties
      rand(5..15).times do |num|
        Party.create({
          table_number: num,
          is_paid: [true, false, false].sample
        })
      end


      # Generate Orders
      parties = Party.all
      foods = Food.all
      rand(10..35)times do |num|
        Order.create({
        party:parties.sample,
        food: foods.sample
        })
      end
  end # junk_data end

  desc "Empty Database"
  task :empty do
    Order.destroy_all
    Food.destroy_all
    Party.destroy_all
  end # task :empty

end # namespace db end
