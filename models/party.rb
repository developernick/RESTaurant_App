class Party < ActiveRecord::Base
  def to_s
    self.to_s + "Party Class Active"
  end
end
