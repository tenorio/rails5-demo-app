class Produto < ApplicationRecord
  validates_presence_of :nome, :descricao
  validates_numericality_of :valor, :greater_than => 0
  validates_numericality_of :estoque, :greater_than => 0
end
