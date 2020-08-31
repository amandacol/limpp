class Ingredient < ApplicationRecord
  has_many :combinations, dependent: :destroy
  has_many :mergers, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_by_name,
      against: [ :name ],
      using: {
        tsearch: { prefix: true }
      }
end
