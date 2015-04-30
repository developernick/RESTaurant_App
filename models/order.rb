class Order < ActiveRecord:: Base
  belongs_to :food_id
  belongs_to :party_id
end
