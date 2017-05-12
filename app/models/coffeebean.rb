class Coffeebean < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :brand, presence: true, length: { minimum: 3 }
  validates :roast_type, presence: true
end
