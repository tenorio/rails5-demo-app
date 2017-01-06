class ProdutoTipo < ApplicationRecord
  has_many :produtos, dependent: :destroy
  validates_length_of :nome, minimum: 3
end
