
require 'rails_helper'

RSpec.describe Municipe, type: :model do
  it "é válido com atributos válidos" do
    municipe = Municipe.new(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
    expect(municipe).to be_valid
  end

  it "é inválido sem nome completo" do
    municipe = Municipe.new(cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
    expect(municipe).to_not be_valid
  end

  it "Deve ser  inválido com o CPF inválido" do # consertar
    municipe = Municipe.new(nome_completo: "Fulano", cpf: "12345678901", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
    expect(municipe).to_not be_valid
  end

  it "Deve ser inválido com e-mail inválido" do # consertar
    municipe = Municipe.new(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulanoexample.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
    expect(municipe).to_not be_valid
  end
  
  it "Deve retornar inválido com data de nascimento inválida" do
    municipe = Municipe.new(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.tomorrow, telefone: "5551999999999", foto: "foto.jpg", status: true)
    expect(municipe).to_not be_valid
  end

  it "Deve retornar inválido com foto de tamanho inválido" do
    municipe = Municipe.new(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto_grande.jpg", status: true)
    expect(municipe).to_not be_valid
  end
  
end
