class Food < ActiveRecord::Base
  def to_s
    self.to_s + "Food Class Active"
  end
end
