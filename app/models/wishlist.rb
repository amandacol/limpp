class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_items, dependent: :destroy
  validates :item, uniqueness: { scope: :user }
  include PgSearch::Model
  multisearchable associated_against: {
    items: [:name]
  },
    using: {
      tsearch: { prefix: true }
    }
end
