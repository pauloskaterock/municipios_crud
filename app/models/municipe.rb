class Municipe < ApplicationRecord
    validates :nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status, presence: true
    validates :cpf, :cns, :email, uniqueness: true
    validate :validar_data_nascimento
  
    def validar_data_nascimento
      errors.add(:data_nascimento, 'inválida') if data_nascimento.present? && data_nascimento > Date.today
    end
  
    has_one :endereco, dependent: :destroy
  end
  