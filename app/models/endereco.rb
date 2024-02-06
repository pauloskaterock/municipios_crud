class Endereco < ApplicationRecord
  belongs_to :municipe

  validates :cep, :logradouro, :bairro, :cidade, :uf, presence: true
end
