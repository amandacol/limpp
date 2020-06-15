class RemoveCertificationFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :certification
  end
end
