# README

CRUD de Munícipes em Ruby on Rails

Este é um projeto simples desenvolvido em Ruby on Rails que implementa um CRUD (Create, Read, Update) para gerenciar munícipes, onde um munícipe pode ser cadastrado, visualizado, atualizado e filtrado por dados pessoais e de endereço.

Tecnologias Utilizadas
Ruby on Rails
PostgreSQL
Rubocop
Gems: mail (para envio de e-mails), twilio-ruby (para envio de SMS via Twilio)

Funcionalidades Implementadas
CRUD completo para gerenciamento de munícipes
Validação de dados do munícipe (CPF, CNS, e-mail, etc.)
Envio de e-mail e SMS após criação/atualização de munícipe
Filtragem de munícipes por dados pessoais e de endereço
Configuração do Ambiente
Clone este repositório:


git clone https://github.com/pauloskaterock/municipios_crud.git
Instale as dependências do projeto:

bundle install
Configure as credenciais de acesso ao banco de dados PostgreSQL no arquivo config/database.yml.

Execute as migrações do banco de dados:


rails db:migrate
Inicie o servidor Rails:
rails server
Testes Automatizados
O projeto inclui testes automatizados escritos com RSpec para garantir o funcionamento correto das funcionalidades. Execute os testes com o seguinte comando:
rspec
Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para abrir um pull request ou reportar problemas nas issues do repositório.

Autores
Paulo Henrique dos Santos




