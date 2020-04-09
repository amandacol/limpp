class Item < ApplicationRecord
  include PgSearch::Model
  has_many :reviews
  has_one_attached :photo
  pg_search_scope :search_by_name_and_ingredient,
    against: [ :name, :ingredient ],
    using: {
      tsearch: { prefix: true }
    }
end
