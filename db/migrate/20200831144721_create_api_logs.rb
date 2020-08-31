class CreateApiLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :api_logs do |t|
      t.integer :status
      t.string :error
      t.string :details
      t.references :coupon, foreign_key: true
      t.references :partner, foreign_key: true

      t.timestamps
    end
  end
end
