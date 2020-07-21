class RemoveItemReFromWishlists < ActiveRecord::Migration[5.2]
  def change
    remove_reference :wishlists, :item, index: true, foreign_key: true
  end
end
