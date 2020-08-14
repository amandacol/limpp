class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item, uniqueness: { scope: :user }
  include PgSearch::Model
  pg_search_scope :search_item_name,
  associated_against: {
  item: [:name]
},
  using: {
    tsearch: { prefix: true }
  }
end
