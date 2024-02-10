
require 'rails_helper'

RSpec.describe "municipes/index", type: :view do
  before(:each) do
    assign(:municipes, [
      Municipe.create!(
        nome_completo: "Fulano",
        cpf: "12345678900",
        cns: "123456789012345",
        email: "fulano@example.com",
        data_nascimento: Date.today,
        telefone: "5551999999999",
        foto: "foto.jpg",
        status: true
      ),
      Municipe.create!(
        nome_completo: "Ciclano",
        cpf: "98765432100",
        cns: "987654321098765",
        email: "ciclano@example.com",
        data_nascimento: Date.today,
        telefone: "5551888888888",
        foto: "foto.jpg",
        status: true
      )
    ])
  end

      
  it "exibe a lista de municipes" do
    assign(:municipes, [
      Municipe.create!(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true),
      Municipe.create!(nome_completo: "Ciclano", cpf: "98765432100", cns: "987654321098765", email: "ciclano@example.com", data_nascimento: Date.today, telefone: "5551888888888", foto: "foto.jpg", status: true)
    ])
    render
    expect(rendered).to match /Fulano/
    expect(rendered).to match /Ciclano/
    
  it "renderiza uma lista de munícipes" do
    render
    assert_select "tr>td", :text => "Fulano", :count => 1
    assert_select "tr>td", :text => "Ciclano", :count => 1
  end

  it "exibe o CPF de cada munícipe" do
    render
    assert_select "tr>td", :text => "12345678900", :count => 1
    assert_select "tr>td", :text => "98765432100", :count => 1
  end

  it "exibe o status de cada munícipe" do
    render
    assert_select "tr>td", :text => "Ativo", :count => 2
  end

  it "exibe um link para cada munícipe" do
    render
    assert_select "a", :text => "Show", :count => 2
  end
end






