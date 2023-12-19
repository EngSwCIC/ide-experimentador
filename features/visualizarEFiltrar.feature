#language: pt
Funcionalidade: Visualizar os e filtrar experimentos

Contexto:
Dado que estou logado como usuário do ide-experimentador

#Cenários Felizes 
Cenario: Visitando a pagina de experimentos
Dado que existem n experimentos
Quando eu acessar a página de experimentos
Então eu devo ver os todos experimentos existentes 
E eu devo ver o botão "Filtro"

Cenario: Filtrando os experimentos
Quando eu clicar no botão "Filtro"
Então eu devo ver o campo "OpcoesFiltro"
E o filtro "Filtro1"
E o filtro "Filtro2"
Quando eu clicar em "Filtro1"
Então eu devo ver apenas os experimentos com a tag "Filtro1"
E ver todos os experimento com a tag "Filtro1"

Cenario: visualização de ausência de experimentos
Dado que não existem experimentos
Quando eu acessar a pagina de experimentos 
E nenhum filtro estiver selecionado
Então eu devo ver nenhum experimento