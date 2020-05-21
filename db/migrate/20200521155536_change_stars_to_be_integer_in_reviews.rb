class ChangeStarsToBeIntegerInReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :stars
    add_column :reviews, :stars, :integer
  end
end
