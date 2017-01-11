class AddFieldsToClientes < ActiveRecord::Migration[5.0]
  def change
    add_column :clientes, :endereco, :string
    add_column :clientes, :sexo, :string, limit: 1
    add_column :clientes, :email, :string
    add_column :clientes, :uf, :string, limit: 2
    add_column :clientes, :cidade, :string
    add_column :clientes, :pais, :string
    add_column :clientes, :cep, :string, limit: 8
    add_column :clientes, :data_nascimento, :date
    add_column :clientes, :newsletter, :boolean
  end
end
