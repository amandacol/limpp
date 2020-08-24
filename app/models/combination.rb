class Combination < ApplicationRecord
  belongs_to :item
  belongs_to :ingredient

  after_create :update_toxicity


  def update_toxicity
    self.item.toxicity_classifier
  end
end
