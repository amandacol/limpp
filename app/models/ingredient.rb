class Ingredient < ApplicationRecord
include PgSearch::Model
pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end