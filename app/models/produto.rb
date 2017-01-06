class Produto < ApplicationRecord
  belongs_to :produto_tipos
  validates_presence_of :nome, :descricao
  validates_numericality_of :valor, :greater_than => 0
  validates_numericality_of :estoque, :greater_than => 0
end
