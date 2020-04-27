class CreateNewitems < ActiveRecord::Migration[5.2]
  def change
    create_table :newitems do |t|

      t.timestamps
    end
  end
end
