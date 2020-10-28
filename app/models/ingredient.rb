class Ingredient < ApplicationRecord
  after_update :update_toxicity
  before_save :toxicityingredient_classifier

  acts_as_taggable_on :confirmados
  acts_as_taggable_on :suspeitos
  acts_as_taggable_on :outros


  has_many :combinations, dependent: :destroy
  has_many :mergers, dependent: :destroy
  has_many :articles, dependent: :destroy


  include PgSearch::Model
  multisearchable against: [:name, :other_names]
  pg_search_scope :search_by_name,
      against: [ :name, :other_names ],
      associated_against: {
      confirmados: [:name],
      suspeitos: [:name],
      outros: [:name],
  },
      using: {
        tsearch: { prefix: true }
      }

    $confirmados = ['Câncer', 'Disruptor Endócrino', 'Toxicidade Reprodutiva', 'Irritantes ou Sensibilizantes']
    $suspeitos = ['Câncer', 'Disruptor Endócrino', 'Toxicidade Reprodutiva', 'Irritantes ou Sensibilizantes']
    $outros = ['Podem ser de origem animal ou vegetal', 'Podem conter glúten', 'Tóxico para o meio ambiente']

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
        rated += 10 if risk_to_enviroment == "red"
        rated += 8 if risk_to_enviroment == "orange"
        rated += 5 if risk_to_enviroment == "yellow"
        rated += 2 if allergenic == "sim"
      self.toxicity_ingredient = rated
  end

  end
