class Item < ApplicationRecord
  include PgSearch::Model
  has_many :wishlists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  pg_search_scope :search_by_name_and_ingredient,
    against: [ :name, :ingredient ],
    using: {
      tsearch: { prefix: true }
    }

    def calculate_average
      reviews = self.reviews
      @size = reviews.reject {|review| review.stars.nil?}
      sum = 0
      reviews.each do |review|
      sum += review.stars unless review.stars.nil?
      end
      average = sum.fdiv(@size.size)
    end
end
