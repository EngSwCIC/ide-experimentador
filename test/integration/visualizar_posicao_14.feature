# language: pt
Funcionalidade: visualizar os dados de posição do robô
Eu como avaliador da navegação do robo
Quero visualizar a posição do robô em um dado momento,
Afim de analisar os percursos escolhidos durante o teste

@javascript
Cenario: Um avaliador seleciona momento fora do escopo do teste (triste)
  Quando o usuario estiver na tela de visualizar posição
  Dado que o usuario solicite o status da posição em um instante fora do escopo do teste, como "-1"
  Então o usuario deveria ver uma mensagem na tela dizendo "Não existem dados de posição para esse momento"

@javascript
Cenario: Busca feita com dados incorretos (triste)
  Quando o usuario estiver na tela de visualizar posição
  Dado que o usuario solicite o status da posição usando caracteres não numéricos, como "teste"
  Então o usuario deveria ver uma mensagem na tela dizendo "Não existem dados de posição para esse momento"

@javascript
Cenario: A pesquisa de posição retorna coordenadas (feliz)
  Quando o usuario estiver na tela de visualizar posição
  Dado que o usuario solicite o status da posição usando dados validos
  Então o usuario deveria ver a posição correspondente desse instante

