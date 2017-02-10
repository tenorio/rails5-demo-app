class Produto < ApplicationRecord
  belongs_to :tipo, inverse_of: :produtos
  accepts_nested_attributes_for :tipo

  mount_uploader :image, ImageUploader

  validates_presence_of :nome, :descricao
  validates_numericality_of :valor, :greater_than => 0
  validates_numericality_of :estoque, {:greater_than => 0, only_integer: true}
end
