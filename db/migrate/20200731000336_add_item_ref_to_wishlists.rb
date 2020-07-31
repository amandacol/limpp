class AddItemRefToWishlists < ActiveRecord::Migration[5.2]
  def change
    add_reference :wishlists, :item, index: true, foreign_key: true
  end
end
