# README

##
# Instalação da gema Devise
# adicionar gem 'devise' no Gemfile
# $ bundle install
# $ rails generate devise:install

# Criação da Model User
$ rails generate devise User
$ rails db:migrate

# Configurações da gem Devise para autenticação
# O devise cria automaticamente as rotas, views, models e controller para todo o processo de autenticação, mas não incluir esses arquivos no projecto automaticamente
# Para gerar as rotas e as views dentro do nosso projeto para manipular o devise rode os seguintes comandos no terminal
$ rails routes | grep devise
$ rails generate devise:views

# O devise barra request com metodos DELETE e POST vindos de outras dependencias como os componentes React e o Cucumber,
# portanto perecisamos alterar o Devise para permitir o acesso a rotas de logout por meio do método get
# No arquivo config/initializer/devise.rb adicione a seguinte linha
config.sign_out_via = :get 

# Configuração da gema Factory Bot e Faker para criar cadastros e logins nos testes automatizados Cucumber e rspec
# Instalar as gemas 'factory_bot_rails' e 'faker'
# Em spec/support criar um arquivo factory_bot.rb e incluir o seguinte codigo
RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
  end

# Depois criar em rspec/support um arquivo para o bot criar users. Adicione o seguinte codigo
FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' }
      # Add any other attributes you want to set for testing purposes
    end
  end

# Agora inclua no topo do aqruivo spec/rails_helper.rb a seguinte linha
require '../spec/spec_helper.rb'  #utilize aqui o path inteiro do spec_helper.rb pois vamos importa-lo novamente para o cucumber em outro arquivo

# Ainda no rails_helper inclua a seguinte linha no corpo do arquivo
 config.include FactoryBot::Syntax::Methods

 # Para utilizar o factory bot nos testes Cucumber novamente inclua a seguinte linha no topo do arquivo com o path do spec_helper onde o bot foi chamado
 require '../spec/spec_helper.rb' 

 # Pronto agora é possível realizar o testes simulando a criação de cadastro e login por um usuário nos testes automatizados.
