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
    e foi renderizada uma página
    então devo ver os botões (representando simuladores) para acessar os experimentos de cada simulador.
Cenário: Visualizar todos os simuladores(Sad Path)
    Dado que acessei a rota específica para configurar ambiente
    e nenhuma página é renderizada
    então deve ser exibida uma mensagem de erro.
