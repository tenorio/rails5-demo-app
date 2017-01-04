class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :valor, precision: 8, scale: 2
      t.integer :estoque

      t.timestamps
    end
  end
end
