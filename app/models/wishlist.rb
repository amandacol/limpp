class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :items, through: :assignments
end
