class Cliente < ApplicationRecord
  validates :nome, length: { minimum: 3 }, presence: true
  validates :sobrenome, length: { minimum: 3 }, presence: true
end
