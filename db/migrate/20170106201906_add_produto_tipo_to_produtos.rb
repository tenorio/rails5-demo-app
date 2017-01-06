class AddProdutoTipoToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :produto_tipo, foreign_key: true
  end
end
