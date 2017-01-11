class Cliente < ApplicationRecord
  validates :nome, length: { minimum: 3 }, presence: true
  validates :sobrenome, length: { minimum: 3 }, presence: true
  validates :sexo, inclusion: { in: %w(M F) }
  validates :uf, format: { with: /\A[a-zA-Z]{2}\z/i }
  validates :cep, format: { with: /\A[0-9]{8}\z/i }
end
