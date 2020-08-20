class Item < ApplicationRecord

  after_create :toxicity_classifier


  acts_as_taggable_on :category
  acts_as_taggable_on :subcategory
  acts_as_taggable_on :toxicity

  has_many :wishlists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :combinations, dependent: :destroy
  has_many :ingredients, through: :combinations
  belongs_to :user
  has_one_attached :photo
  has_many_attached :certification_photos

  include PgSearch::Model
  multisearchable against: [:name]
  pg_search_scope :search_by_name_and_ingredient,
    against: [ :name ],
    associated_against: {
    category: [:name],
    subcategory: [:name],
    toxicity: [:name],
    ingredients: [:name]
  },
    using: {
      tsearch: { prefix: true }
    }

    $category = ['Cabelos', 'Higiene Pessoal', 'Cuidados com a pele', 'Maquiagem']
    $subcategory = ['Shampoos', 'Tratamentos Capilares', 'Finalizadores Capilares', 'Tinturas', 'Desodorantes', 'Higiene Bucal', 'Limpeza Facial', 'Limpeza Corporal', 'Tratamento Facial', 'Tratamento Corporal', 'Protetor Solar', 'Maquiagem Pele', 'Maquiagem Olhos', 'Maquiagem Lábios' ]
    $toxicity = ['Não contém tóxicos avaliados pelo limpp', 'Vegano', 'Grávidas deveriam evitar', 'Contém glúten', 'Não alergênico']

    def calculate_average
      return 0 unless reviews.any?
      reviews.average(:rating).to_i
    end

    def count_certification_photo
      certification_photos.count
    end

    def toxicity_classifier
      rated = 0
      # colors = %w(red yellow)
      self.ingredients.each do |ingredient|
        rated += 10 if ingredient.risk_to_health == "red"
        rated += 5 if ingredient.risk_to_health == "yellow"
        rated += 10 if ingredient.risk_to_enviroment == "red"
        rated += 5 if ingredient.risk_to_enviroment == "yellow"
        rated += 2 if ingredient.allergenic == "sim"

      end
      self.update(toxicity_rate: rated)
    end
end
