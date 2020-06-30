class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item, uniqueness: { scope: :user }
  include PgSearch::Model
  multisearchable  associated_against: {
    items: [:name]
  }
end
