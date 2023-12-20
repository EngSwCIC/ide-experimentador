o#language: pt
Funcionalidade: Visualizar testes dos experimentos como cards
  Eu como um usuário
  Eu quero visualizar os testes como cards

Contexto:
  Dado que estou logado como usuário no ide-experimentador
  E que não existem testes no experimento "Experimento 2"
  E que existem os testes "Teste 1", "Teste 2", "Teste 3", "Teste 4" no experimento "Experimento 1"
  E que existe os testes "Teste 5", "Teste 6" no experimento "Experimento 3"
  E que o card do "Teste 1" contém "x:0 y:0 z:0", bateria: "90%", resultado: "sucesso", runs:"100"
  E que o card do "Teste 2" contém "x:1 y:1 z:1", bateria: "50%", resultado: "falha", runs:"1"
  E que o card do "Teste 3" contém "x:1 y:1 z:1", bateria: "50%", resultado: "falha", runs:"51"
  E que o card do "Teste 4" contém "x:1 y:1 z:0", bateria: "70%", resultado: "sucesso", runs:"76"
  E que o card do "Teste 5" contém "x:- y:- z:-", bateria: "-", resultado: "N/A", runs:"0"
  E que o card do "Teste 6" contém "x:0 y:1 z:0", bateria: "40", resultado: "sucesso", runs:"1"

# Cenários Gerais (relacionados a lista de testes)
Cenário: Não há testes no experimento
  Dado que estou no experimento "Experimento 2"
  Então eu deveria ver a mensagem "Nenhum teste foi cadastrado no sistema"

# Cenário feliz
Cenário: Há testes no experimento
  Dado que os testes "Teste 1", "Teste 2", "Teste 3", "Teste 4" estão selecionados no experimento "Experimento 1"
  Então eu deveria ver o card "Teste 1", "x:0 y:0 z:0", bateria: "90%", resultado: "sucesso", runs:"100"
  E eu deveria ver o card "Teste 2", "x:1 y:1 z:1", bateria: "50%", resultado: "falha", runs:"1"
  E eu deveria ver o card "Teste 3", "x:1 y:1 z:1", bateria: "50%", resultado: "falha", runs:"51"
  E eu deveria ver o card "Teste 4", "x:1 y:1 z:0", bateria: "70%", resultado: "sucesso", runs:"76"
  
# Cenário feliz
Cenário: Todos os testes executados
  Dado que os testes "Teste 1", "Teste 2", "Teste 3", "Teste 4" estão selecionados no experimento "Experimento 1"
  E que pressionei o botão executar
  Então eu deveria ver o ícone "carregando" nos testes selecionados "Teste 1", "Teste 2", "Teste 3", "Teste 4"
  Quando os testes selecionados "Teste 1", "Teste 2", "Teste 3", "Teste 4" terminarem de executar
  Então eu deveria ver o card "Teste 1", "x:0 y:1 z:1", bateria: "60%", resultado: "sucesso", runs:"101"
  E eu deveria ver o card "Teste 2", "x:0 y:0 z:0", bateria: "90%", resultado: "sucesso", runs:"2"
  E eu deveria ver o card "Teste 3", "x:1 y:0 z:1", bateria: "60%", resultado: "falha", runs:"52"
  E eu deveria ver o card "Teste 4", "x:1 y:1 z:1", bateria: "95%", resultado: "sucesso", runs:"77"

# Cenário feliz
Cenário: Alguns testes executados
  Dado que os testes "Teste 1", "Teste 3" estão selecionados no experimento "Experimento 1"
  E que pressionei o botão executar
  Então eu deveria ver o ícone "carregando" nos testes selecionados "Teste 1", "Teste 3"
  Quando os testes selecionados "Teste 1", "Teste 3" terminarem de executar
  Então eu deveria ver o card "Teste 1", "x:0 y:1 z:1", bateria: "60%", resultado: "sucesso", runs:"101"
  E eu deveria ver o card "Teste 3", "x:1 y:0 z:1", bateria: "60%", resultado: "falha", runs:"52"
  E eu deveria ver o card "Teste 2", "x:1 y:1 z:1", bateria: "50%", resultado: "falha", runs:"1"
  E eu deveria ver o card "Teste 4", "x:1 y:1 z:0", bateria: "70%", resultado: "sucesso", runs:"76"


# Cenários Gerais (relacionados ao card do teste)
Cenário: Teste nunca executado
  Dado que estou no experimento "Experimento 3"
  Então eu deveria ver o nome do teste "Teste 5"
  E as tags devem ser "tag1", "tag2"
  E o campo "coordenadas" deve ser "x:-  y:-  z:-"
  E o campo "bateria" deve ser "-"
  E o campo "resultado" deve ser "N/A"
  E o campo "runs" deve ser "0"

# Cenário feliz
Cenário: Teste executado
  Dado que o teste "Teste 5" está selecionado no experimento "Experimento 3"
  E que pressionei o botão executar
  Então eu deveria ver o ícone "carregando" no teste selecionado "Teste 5"
  Quando o teste selecionado "Teste 5" terminar de executar
  Então eu deveria ver o nome do teste "Teste 5"
  E as tags "tag1", "tag2"
  E o campo "coordenadas" deve ser "x: 0  y: 1  z: 1"
  E o campo "bateria" deve ser "60%"
  E o campo "resultado" deve ser "sucesso"
  E o campo "runs" deve ser "1"

Cenário: Teste executado sem entrada no banco de dados
  Dado que o teste "Teste 6" do "Experimento 3" foi executado
  E que não houve retorno no banco de dados
  Então eu deveria ver o card "Teste 6", "x:- y:- z:-", bateria: "-", resultado: "N/A", runs:"1"

# Cenário feliz
Cenário: Visualizar mais detalhes do teste
  Dado que estou no teste "Teste 2" do experimento "Experimento 2"
  E o botão "mais opções" é pressionado
  Então uma lista de opções com "mais detalhes" deve aparecer
  Quando eu pressiono o botão "mais detalhes"
  Então eu deveria ver um modal com 4 páginas e uma opção de fechar o modal

# Cenário feliz
Cenário: Visualizar modal
  Dado que estou visualizando o modal de "mais detalhes" do "Teste 2" no "Experimento 2"
  E o botão "bateria" é pressionado
  Então um destaque no ícone de "bateria" deveria aparecer
  E a página vazia com futuros detalhes da "bateria" deveria aparecer
  Quando eu pressiono o botão "coordenadas"
  Então um destaque no ícone de "coordenadas" deveria aparecer
  E a página vazia com futuros detalhes de "coordenadas" deveria aparecer
  Quando eu pressiono o botão "velocidade"
  Então um destaque no ícone de "velocidade" deveria aparecer
  E a página vazia com futuros detalhes de "velocidade" deveria aparecer
  Quando eu pressiono o botão "Runs"
  Então um destaque no ícone de "Runs" deveria aparecer
  E a página vazia com futuros detalhes de "Runs" deveria aparecer

# Cenário feliz
Cenário: Fechar modal
  Dado que estou visualizando o modal de "mais detalhes" do "Teste 2" no "Experimento 2"
  E o botão "fechar" é pressionado
  Então eu estou no experimento "Experimento 2"
