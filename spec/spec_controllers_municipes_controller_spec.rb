
require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  describe "Cenario POST #create" do
    context "com atributos válidos" do
      it "cria um novo municipe" do
        expect {
          post :create, params: { municipe: { nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true } }
        }.to change(Municipe, :count).by(1)
      end
    end

  end


  describe "GET #index" do
    it "Esse cenario retorna status 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "renderiza o template index" do # consertar
      get :index
      expect(response).to render_template(:index)
    end

    it "atribui todos os munícipes a @municipes" do # consertar
      municipe1 = Municipe.create(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
      municipe2 = Municipe.create(nome_completo: "Ciclano", cpf: "98765432100", cns: "987654321098765", email: "ciclano@example.com", data_nascimento: Date.today, telefone: "5551888888888", foto: "foto.jpg", status: true)
      
      get :index
      expect(assigns(:municipes)).to eq([municipe1, municipe2])
    end
  end

  describe "GET #show" do
    it "Deve retornar o status 200" do # consertar
      municipe = Municipe.create(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
      get :show, params: { id: municipe.id }
      expect(response).to have_http_status(200)
    end

    it "Deve renderizar o template show" do # consertar
      municipe = Municipe.create(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
      get :show, params: { id: municipe.id }
      expect(response).to render_template(:show)
    end

    it "Deve atribuir o munícipe correto a @municipe" do # consertar
      municipe = Municipe.create(nome_completo: "Fulano", cpf: "12345678900", cns: "123456789012345", email: "fulano@example.com", data_nascimento: Date.today, telefone: "5551999999999", foto: "foto.jpg", status: true)
      get :show, params: { id: municipe.id }
      expect(assigns(:municipe)).to eq(municipe)
    end
  end
end 
 # adicionar mais cenarios




