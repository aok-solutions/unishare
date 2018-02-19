class Ride < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :users

  def available_seats
    self.seats - self.users.count
  end
end
