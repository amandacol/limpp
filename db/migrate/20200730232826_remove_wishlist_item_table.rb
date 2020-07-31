class RemoveWishlistItemTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :wishlist_items
  end
end
