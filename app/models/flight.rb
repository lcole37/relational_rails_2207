class Flight < ApplicationRecord
  has_many :passengers

  def passenger_count
    self.passengers.count
  end
end
