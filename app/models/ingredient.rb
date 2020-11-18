class Ingredient < ApplicationRecord
  after_update :update_toxicity
  before_save :toxicityingredient_classifier

  acts_as_taggable_on :type
  acts_as_taggable_on :vegan


  has_many :combinations, dependent: :destroy
  has_many :mergers, dependent: :destroy
  has_many :articles, dependent: :destroy


  include PgSearch::Model
  multisearchable against: [:name, :other_names]
  pg_search_scope :search_by_name,
      against: [ :name, :other_names ],
      associated_against: {
      type: [:name],
      vegan: [:name],
  },
      using: {
        tsearch: { prefix: true }
      }

    $type = ['Carcinogênico', 'Disruptor Endócrino', 'Tóxico para Reprodução e ou Feto', 'Irritante e ou Sensibilizante']
    $vegan = ['Pode ser de origem animal ou vegetal', 'Pode conter glúten']

  def update_toxicity
    self.combinations.each do |combination|
      combination.item.toxicity_classifier
    end
  end

  def toxicityingredient_classifier
      rated = 0
        rated += 10 if risk_to_health == "red"
        rated += 8 if risk_to_health == "orange"
        rated += 5 if risk_to_health == "yellow"
        rated += 2 if risk_to_health == "grey"
        rated += 10 if risk_to_enviroment == "red"
        rated += 8 if risk_to_enviroment == "orange"
        rated += 5 if risk_to_enviroment == "yellow"
        rated += 2 if risk_to_enviroment == "grey"
        rated += 2 if allergenic == "sim"
      self.toxicity_ingredient = rated
  end

  end
