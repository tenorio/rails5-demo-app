class Tipo < ApplicationRecord
  has_many :produtos, inverse_of: :tipo
  validates_presence_of :nome
end
