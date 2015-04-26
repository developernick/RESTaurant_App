class Order < ActiveRecord::Base
  def to_s
    self.to_s + "Order Class Active"
  end
end
