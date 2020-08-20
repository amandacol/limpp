class AddToxicityToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :toxicity_rate, :integer
  end
end
