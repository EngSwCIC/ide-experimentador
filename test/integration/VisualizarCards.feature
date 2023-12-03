#language: pt
Funcionalidade: Visualizar testes dos experimentos como cards
  Eu como um usuário
  Eu quero visualizar os testes como cards

Contexto:
  Dado que estou logado como usuário do ide-experimentador
  E eu estou na página do experimento

# Cenários Gerais (relacionados a lista de testes)
# Cenário triste
Cenário: Não há testes no experimento
  Dado que nenhum teste do experimento '2' foi criado no sistema
  Quando eu abrir a página do experimento
  Então eu deveria ver uma mensagem na tela dizendo "Nenhum teste foi cadastrado no sistema"

# Cenário feliz
Cenário: Há testes no experimento
  Dado que o experimento '2' foi criado no sistema
  E que existem '4' testes não executados no experimento
  Então eu deveria ver todos os '4' testes não executados como cards
  E eu deveria ver no primeiro card 'Teste 1', 'x:0 y:0 z:0', bateria: '90%', resultado: 'sucesso', runs:'100'
  E eu deveria ver no segundo card 'Teste 2', 'x:1 y:1 z:1', bateria: '50%', resultado: 'falha', runs:'1'
  E eu deveria ver no terceiro card 'Teste 3', 'x:1 y:1 z:1', bateria: '50%', resultado: 'falha', runs:'51'
  E eu deveria ver no quarto card 'Teste 4', 'x:1 y:1 z:0', bateria: '70%', resultado: 'sucesso', runs:'76'
  
# Cenário feliz
Cenário: Todos os testes executados
  Dado que todos os '4' testes estão selecionados
  E que pressionei o botão executar 'experimento 2' no menu lateral
  Então eu deveria ver ícone do resultado do teste em execução em todos os '4' testes selecionados
  Quando todos os testes terminarem
  Então eu deveria ver no primeiro card 'Teste 1', 'x:0 y:1 z:1', bateria: '60%', resultado: 'sucesso', runs:'1'
  E eu deveria ver no segundo card 'Teste 2', 'x:0 y:0 z:0', bateria: '90%', resultado: 'sucesso', runs:'101'
  E eu deveria ver no terceiro card 'Teste 3', 'x:1 y:1 z:1', bateria: '50%', resultado: 'falha', runs:'51'
  E eu deveria ver no segundo card 'Teste 4', 'x:1 y:1 z:0', bateria: '70%', resultado: 'sucesso', runs:'76'

# Cenário feliz
Cenário: Alguns testes executados
  Dado que os testes 'Teste 1' e 'Teste 3' estão selecionados
  E que os testes 'Teste 2' e 'Teste 4' não estão selecionados 
  E que pressionei o botão executar no menu lateral
  Então eu deveria ver ícone do resultado do teste em execução em todos os testes selecionados
  Quando todos os testes selecionados terminarem
  Então eu deveria ver no primeiro card 'Teste 1', 'x:0 y:1 z:1', bateria: '60%', resultado: 'sucesso', runs:'1'
  E eu deveria ver no terceiro card 'Teste 3', 'x:1 y:1 z:1', bateria: '50%', resultado: 'falha', runs:'51'
  E eu deveria ver o 'Teste 2' como estava antes
  E eu deveria ver o 'Teste 4' como estava antes


# Cenários Gerais (relacionados ao card do teste)
# Cenário triste
Cenário: Teste nunca executado
  Dado que o teste 'Teste 2' nunca foi executado
  Então eu deveria ver o nome do teste 'Teste 2'
  E as tags 'tag1' e 'tag2'
  E o campo coordenadas deve ser "x: -  y: -  z: -"
  E o campo bateria deve ser "-"
  E o ícone do resultado deve ser "vazio"
  E o campo runs deve ser "0"

# Cenário feliz
Cenário: Teste executado
  Dado que o teste 'Teste 2' nunca foi executado
  E o botão executar é pressionado
  Então o ícone do resultado deve ser "carregando"
  E o ícone de execução deve ser "parar"
  Quando o teste terminar
  Então eu deveria ver o nome do teste 'Teste 2'
  E as tags 'tag1' e 'tag2'
  E o campo coordenadas deve ser "x: 0  y: 1  z: 1"
  E o campo bateria deve ser "60%"
  E o ícone do resultado do teste deve ser "sucesso"
  E o campo runs deve ser "1"

# Cenário feliz
Cenário: Visualizar mais detalhes do teste
  Dado que estou visualizando o teste 'Teste 2' 
  E o botão 'mais opções' é pressionado
  Então uma lista de opções com 'mais detalhes' deve aparecer
  Quando eu clicar em 'mais detalhes'
  Então eu deveria ver um modal com 4 páginas e uma opção de fechar o modal

# Cenário feliz
Cenário: Visualizar modal
  Dado que estou visualizando o modal de 'mais detalhes' do 'Teste 2' 
  E o botão 'bateria' é pressionado
  Então um destaque no ícone de 'bateria' deveria aparecer
  E a página vazia com futuros detalhes da 'bateria' deveria aparecer
  Quando eu pressiono no botão de 'coordenadas'
  Então um destaque no ícone de 'coordenadas' deveria aparecer
  E a página vazia com futuros detalhes de 'coordenadas' deveria aparecer
  Quando eu pressiono no botão de 'velocidade'
  Então um destaque no ícone de 'velocidade' deveria aparecer
  E a página vazia com futuros detalhes de 'velocidade' deveria aparecer
  Quando eu pressiono no botão de 'Runs'
  Então um destaque no ícone de 'Runs' deveria aparecer
  E a página vazia com futuros detalhes de 'Runs' deveria aparecer

# Cenário feliz
Cenário: Fechar modal
  Dado que estou visualizando o modal de 'mais detalhes' do 'Teste 2' 
  E o botão 'fechar' é pressionado
  Então o modal é fechado
  E eu visualizo a lista de testes como cards

 
