class AddEmailToNewitems < ActiveRecord::Migration[5.2]
  def change
    add_column :newitems, :email, :string
  end
end
