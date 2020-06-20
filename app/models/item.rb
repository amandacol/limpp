class Item < ApplicationRecord
  acts_as_taggable_on :category
  acts_as_taggable_on :subcategory
  acts_as_taggable_on :toxicity
  include PgSearch::Model
  has_many :wishlists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :coupons, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  has_many_attached :certification_photos
  pg_search_scope :search_by_name_and_ingredient,
    against: [ :name, :ingredient ],
    associated_against: {
    category: [:name],
    subcategory: [:name],
    toxicity: [:name]
  },
    using: {
      tsearch: { prefix: true }
    }

    $category = ['Cabelos', 'Higiene Pessoal', 'Cuidados com a pele', 'Maquiagem']
    $subcategory = ['Shampoo', 'Tratamentos Capilares', 'Finalizadores', 'Tinturas', 'Desodorantes', 'Higiene Bucal', 'Limpeza Facial', 'Limpeza Corporal', 'Tratamento Facial', 'Tratamento Corporal', 'Pele', 'Olhos', 'Lábios', 'Multifunção']
    $toxicity = ['Não contém tóxicos avaliados pelo limpp', 'Muito Tóxico', 'Tóxico']
    def calculate_average
      return 0 unless reviews.any?
      reviews.average(:rating).to_i
    end
end
