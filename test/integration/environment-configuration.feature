#language: pt
Funcionalidade: Dado que sou um usuario, quero poder configurar o ambiente para atrelar a um experimentador
    Eu como um usuário quero visualizar todos os simuladores em uma rota e realizar operações de CRUD e modificações
    rápidas na tela de configuração de ambiente.

Contexto:
  
    Dado que sou um usuário externo
    quero acessar uma rota que permite a interação com os dados e funcionalidades do aplicativo
    por meio de solicitações HTTP, como GET, POST, PUT, DELETE, entre outras. Tudo isso sem estar
    necessariamente logado.

Cenário: Visualizar todos os simuladores(Happy Path)
    Dado que acessei a rota específica para visualizar todos os simuladores
    E foi renderizada uma página
    Então devo ver os botões (representando simuladores) para acessar os experimentos de cada simulador.
Cenário: Visualizar todos os simuladores(Sad Path)
    Dado que acessei a rota específica para configurar ambiente
    E nenhuma página é renderizada
    Então deve ser exibida uma mensagem de erro.

Cenário: Visualizar um Experimento de um Simulador(Happy Path)
    Dado que estou na página de configuração de ambiente
    E eu estou vendo o Simulador 1
    Quando eu apertar no botão "Ver Experimentos"
    Então devo ser capaz de listar todos os experimentos relacionados
Cenário: Visualizar um Experimento de um Simulador(Sad Path)
    Dado que estou na página de configuração de ambiente
    E eu estou vendo o Simulador 1
    Quando eu apertar no botão "Ver Experimentos"
    E não houver experimentos ligados
    Então devo ver "Nenhum Experimento" na tela.

Cenário: Desativar e Ativar Simulador (Happy Path)
    Dado que estou na página de configuração do Simulador 1,
    E eu estou vendo o Simulador 1 ativo,
    Quando eu apertar o botão "Desativar Simulador",
    Então devo receber uma confirmação de que o simulador foi desativado com sucesso.

    Dado que estou na página de configuração do Simulador 1,
    E eu estou vendo o Simulador 1 inativo,
    Quando eu apertar o botão "Ativar Simulador",
    Então devo receber uma confirmação de que o simulador foi ativado com sucesso.

Cenário: Desativar e Ativar Simulador (Sad Path)
    Dado que estou na página de configuração do Simulador 1,
    E eu estou vendo o Simulador 1 ativo,
    Quando eu apertar o botão "Desativar Simulador",
    E não houver simuladores ligados
    Então devo ver "Nenhum Simulador selecionando" na tela.

    Dado que estou na página de configuração do Simulador 1,
    E eu estou vendo o Simulador 1 inativo,
    Quando eu apertar o botão "Ativar Simulador",
    E não houver simuladores ligados
    Então devo ver "Nenhum Simulador selecionando" na tela.
