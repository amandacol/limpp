class Ingredient < ApplicationRecord
  has_many :combinations, dependent: :destroy
include PgSearch::Model
pg_search_scope :search_by_name,
    against: [ :name ],
    associated_against: {
    ingredient: [:name]
  },
    using: {
      tsearch: { prefix: true }
    }
end
