class MunicipesController < ApplicationController
    before_action :set_municipe, only: [:show, :edit, :update]
  
    def index
      @municipes = Municipe.all
    end
  
    def show
    end
  
    def new
      @municipe = Municipe.new
    end
  
    def create
      @municipe = Municipe.new(municipe_params)
      if @municipe.save
        # Envie email e SMS para o municipe
        redirect_to @municipe, notice: 'Municipe criado com sucesso.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @municipe.update(municipe_params)
        # Envie email e SMS para o municipe
        redirect_to @municipe, notice: 'Municipe atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    private
  
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end
  
    def municipe_params
      params.require(:municipe).permit(:nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status)
    end
    private

  def send_email_notification(municipe)
    # Lógica para enviar e-mail de notificação
    # Exemplo de uso da gem 'mail':
    Mail.deliver do
      to municipe.email
      from 'seu_email@example.com'
      subject 'Cadastro/Atualização de Municipe'
      body "Olá #{municipe.nome_completo}, seu cadastro/mudança de status foi realizado com sucesso!"
    end
  end

    private

    def send_sms_notification(municipe)
      require 'twilio-ruby'
  
      account_sid = 'YOUR_TWILIO_ACCOUNT_SID'
      auth_token = 'YOUR_TWILIO_AUTH_TOKEN'
      client = Twilio::REST::Client.new(account_sid, auth_token)
  
      client.messages.create(
        from: 'YOUR_TWILIO_PHONE_NUMBER',
        to: municipe.telefone,
        body: "Olá #{municipe.nome_completo}, seu cadastro/mudança de status foi realizado com sucesso!"
      )
    end

    class MunicipesController < ApplicationController
        # Restante do código...
      
        def index
          @municipes = Municipe.all
          @municipes = @municipes.where(nome_completo: params[:nome_completo]) if params[:nome_completo].present?
          @municipes = @municipes.where(status: params[:status]) if params[:status].present?
          # Adicione mais filtros conforme necessário
        end
      end
      



  end
  