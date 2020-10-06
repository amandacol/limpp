class Ingredient < ApplicationRecord
  after_update :update_toxicity
  has_many :combinations, dependent: :destroy
  has_many :mergers, dependent: :destroy
  has_many :articles, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_by_name,
      against: [ :name ],
      using: {
        tsearch: { prefix: true }
      }

  def update_toxicity
    self.combinations.each do |combination|
      combination.item.toxicity_classifier
    end
  end

end
