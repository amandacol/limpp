class ChangeAttributesToContent < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :attributes
    remove_column :reviews, :buyagain
    add_column :reviews, :buyagain, :boolean, default: true, null: false
  end
end
