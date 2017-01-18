class Tipo < ApplicationRecord
  has_many :produtos, inverse_of: :tipo
  validates_presence_of :nome

  scope :all_ordered_by_nome, -> { order(:nome) }
end
