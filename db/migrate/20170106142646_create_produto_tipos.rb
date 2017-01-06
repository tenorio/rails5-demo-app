class CreateProdutoTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :produto_tipos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
