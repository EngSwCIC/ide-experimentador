# language: pt-Br
# encoding: utf-8

Funcionalidade: Pesquisar os testes utilizando filtros
Eu como usuário
Quero filtrar os testes por tags, coordenadas ou porcentagem da bateria
A fim de obter somente os testes relacionados aos filtro selecionados com maior velocidade

Contexto:

    Dado que eu esteja logado como usuário no ide-experimentador
    E eu esteja na página de pesquisar por testes
    Quando eu entrar no campo de pesquisa
    Então eu devo ver os campos de filtro 'tag','coordenadas', 'bateria', ‘status’ e ‘ativo’


Cenário: Um usuário pesquisa por um teste utilizando somente uma tag (feliz)

    Dado que tenha um ou mais testes com a tag 'Rápido' cadastrado,
    E que eu selecione o filtro 'tag',
    Quando eu escrever 'Rápido' na barra de pesquisa do filtro,
    E eu clicar no botão 'Pesquisar',
    Então eu devo ver todos os testes com a tag 'Rápido' cadastrados.


Cenário: Um usuário pesquisa por um teste utilizando somente as coordenadas (feliz) 

    Dado que tenha um ou mais testes com as coordenadas "X=0 Y=1 Z=0" cadastrados,
    E que eu selecione o filtro 'coordenadas',
    Quando eu escrever '0 1 0' nos três campos "X Y Z" respectivamente,
    E eu clicar no botão 'Pesquisar' ,
    Então eu devo ver todos os testes com as coordenadas 'X=0 Y=1 Z=0' cadastrados.


Cenário: Um usuário pesquisa por um teste utilizando somente a bateria (feliz) 

    Dado que tenha um ou mais testes com robôs que possuem bateria igual a '70%',
    E que eu selecione o filtro 'bateria',
    E seleciono o campo de inserção,
    Quando eu inserir um o valor “70” na porcentagem da bateria,
    E clicar no botão 'Pesquisar',
    Então eu devo ver todos os testes em que o robô possui a bateria igual a '70%'.

Cenário: Um usuário pesquisa por um teste utilizando o filtro "Ativo" (feliz) 

    Dado que tenha pelo menos um teste cadastrado no experimento,
    E que eu selecione o filtro ‘ativo’,
    Quando eu selecionar a opção ‘desabilitado’,
    E eu clicar no botão ‘Pesquisar’,
    Então eu devo ver todos os testes que foram desabilitados no experimento.


Cenário: Um usuário pesquisa por um teste utilizando somente o filtro ‘status’ (feliz) 

    Dado que exista um ou mais testes cadastrados no experimento,
    E que eu selecione o filtro ‘Status’ ,
    Quando eu selecionar a opção ‘Aprovado’,
    Então eu devo ver todos os testes que foram concluídos sem nenhum erro.


Cenário: Usuário pesquisa por um teste utilizando somente a bateria (triste) 

	Dado que exista um ou mais testes cadastrados no experimento,
	Quando eu selecionar a opção filtrar por 'bateria',
	E selecionar o campo de inserção,
	Quando eu inserir o valor ‘121’ na porcentagem da bateria,
    E clicar no botão 'Pesquisar',
	Então devo ver uma mensagem de aviso, indicando que o número inteiro inserido precisa estar limitado ao intervalo de 0 a 100.

	
Cenário: Um Usuário pesquisa por um teste utilizando mais de um filtro (feliz) 

    Dado que tenha pelo menos um teste cadastrado no experimento,
    E que eu selecione o filtro ‘tag’,
    Quando eu escrever ‘Ciência’ na barra de pesquisa do filtro,
    Então eu devo ver um botão de adicionar novo filtro (‘+’) ao lado do filtro ‘tag’,
    Quando eu clicar no botão ‘+’,
    Então devo ver mais uma caixa de seleção de filtro e uma caixa de seleção central com as opções ‘&’ ou ‘Ou’ ,
    Quando eu selecionar a opção ‘Ou’ e o filtro ‘bateria’,
    E inserir um o valor ‘92’ na porcentagem da bateria,
    E clicar no botão ‘Pesquisar’,
    Então devo ver todos os testes que tenham a tag ‘Ciência’ quanto os testes com a bateria em ‘92%’.


Cenário: Um usuário pesquisa por um teste utilizando um ou mais campos dos filtros (triste) 

    Dado que não tenha nenhum teste com esse/s 'filtro/s' cadastrado/s,
    Quando eu escrever no campo de um ou mais filtros,
    E eu apertar 'enter',
    Então eu devo ver uma mensagem de aviso, indicando que nenhum teste foi encontrado para o/os filtro/s selecionado/s.
