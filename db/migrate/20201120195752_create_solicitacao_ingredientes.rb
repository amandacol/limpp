class CreateSolicitacaoIngredientes < ActiveRecord::Migration[5.2]
  def change
    create_table :solicitacao_ingredientes do |t|
      t.string :email
      t.string :ingrediente
      t.text :obs

      t.timestamps
    end
  end
end
