class DropNewitems < ActiveRecord::Migration[5.2]
  def change
    drop_table :newitems
  end
end
