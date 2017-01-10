class AddTipoRefToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :tipo, foreign_key: true
  end
end
