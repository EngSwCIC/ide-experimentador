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

Cenário: Criar um simulador (Happy path)
    Dado que o usuário está logado e  na página de configurações 
    E deseja adicionar um novo simulador
    Quando clicar no botão "Adicionar novo simulador"
    E adicionar uma URL válida
    Então é gerado um novo simulador
    E o usuário recebe uma confirmação de que o simulador foi criado com sucesso.

Cenário:Criar um simulador (Sad path)
    Dado que o usuario está logado e na página de configurações 
    E deseja adicionar um novo simulador
    Quando clicar no botão "Adicionar novo simulador"
    E adicionar uma URL inválida
    Então a criação do simulador falha 
    E o usuário recebe uma mensagem de erro informando que o simulador não foi criado.

Cenário: Exluir um simulador (Happy path)
    Dado que o usuario está na página de configurações 
    E deseja excluir simulador
    Quando selecionar o simulador 
    E clicar no botão "Excluir simulador"
    Então o simulador é removido 
    E o usuário recebe uma mensagem de confirmação da exclusão

Cenário: Excluir um simulador (Sad path)
    Dado que o usuario está na página de configurações 
    E deseja excuir simulador
    Quando selecionar o simulador 
    E clicar no botão "Excluir simulador"
    E o simulador não é removido 
    Então o usuário recebe uma mensagem de erro informando que o simulador não foi excluído.
