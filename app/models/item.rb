class Item < ApplicationRecord
  acts_as_taggable_on :category
  acts_as_taggable_on :subcategory
  acts_as_taggable_on :toxicity
  include PgSearch::Model
  has_many :wishlists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :combinations, dependent: :destroy
  has_many :ingredients, through: :combinations
  belongs_to :user
  has_one_attached :photo
  has_many_attached :certification_photos
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
end
