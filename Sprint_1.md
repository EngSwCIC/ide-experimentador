# Grupo 05 (Issue 11): Dado que sou um usúario, quero poder filtrar os testes

## Nome e Matrícula dos Integrantes do Grupo:
 
```
Daniel do Carmo Figueiredo - **160057922**
Gabriel de Castro Dias - **211055432**
João Victor Pereira Vieira - **211036114**
Luiz Henrique Silva de Andrade - **211010430**
Sofia Dy La Fuente Monteiro - **211055530**

``` 

### Escopo do Projeto:

- **Objetivo:** Adicionar à tela de pesquisa de testes por filtros, as funcionalidades específicas para cada filtro.

- **Entregas:** Desenvolvimento completo das features de filtro, tanto no frontend quanto no backend, até a data de entrega.

- **Requisitos:** Utilização das tecnologias React e Ruby on Rails, com abordagem funcional do projeto.

- **Restrições:** Tempo de desenvolvimento limitado, sendo necessário cumprir os prazos estabelecidos. Pré-requisito de conhecimento das tecnologias mencionadas.

- **Exclusões:** Não serão implementadas as issues de outros grupos, focando apenas nas funcionalidades de filtro.

- **Marcos:** Cada sprint deve ter um objetivo bem definido, com desenvolvimento dentro do prazo estabelecido. O código deve ser claro e conciso.


## Perguntas referentes a Sprint_1:

### Quem fez o papel de Scrum Master? E o de Product Owner?

- Quem ficou responsável pelo papel de Scrum Master foi _João Victor Pereira_ , o papel de Product Owner não foi feito por ninguém nessa sprint, visto que todos participaram da reunião com o Stakeholder

### Quais funcionalidades serão desenvolvidas? Quais serão as regras de negócio para cada funcionalidade?

- As funcionalidade a serem desenvolvidas serão: 
    Filtros para Tags, Coordenadas Bateria, Status e Ativo

- Regras de Negócio:
    1. Os campos de bateria e coordenada limitará a somente utilizar números inteiros
    2. Quando uma coordenada estiver vazia, será considerado somente os campos que estiverem prenchidos para a busca
    3. Será possível buscar por um ou mais filtros ao mesmo tempo, porém o filtro 'bateria' não poderá se repetir
    4. Somente o filtro 'tags' poderá utilizar condicional "&" e "Ou", para os demais só poderá ser utilizado o "Ou"

### Quem ficou responsável por cada funcionalidade?

**Filtro de Tags:** _Gabriel e Daniel_
**Filtro de Coordenadas:** _João Victor_
**Filtro de Bateria:** _Luiz Henrique_
**Filtro de Status e Ativo:** _Sofia_


### Qual a política de branching utilizada pelo grupo?

- Utilizaremos somente uma Branch de Feature, onde todos do grupo trabalharão juntos na mesma branching

---

## Histórias de Usuário com a métrica Velocity

### Contexto: 

    Dado que sou um usuário
    E estou na tela de pesquisa com filtros

### Contexto:
'''
    Dado que eu esteja logado como usuário no ide-experimentador
    E eu esteja na página de pesquisar por testes
    Quando eu entrar no campo de pesquisa
    Então eu devo ver os campos de filtro 'tag','coordenadas', 'bateria', ‘status de erro’ e  ‘ativo’
'''    

#### Cenário: Um usuário pesquisa por um teste utilizando somente uma tag (feliz) - {c:yellow}4{/c}
'''
    Dado que tenha um ou mais testes com a tag 'Rápido' cadastrado
    E que eu selecione o filtro 'tag'
    Quando eu escrever 'Rápido' na barra de pesquisa do filtro
    E eu clicar no botão 'Pesquisar' 
    Então eu devo ver todos os testes com a tag 'Rápido' cadastrado
'''

#### Cenário: Um usuário pesquisa por um teste utilizando somente as coordenadas (feliz) - {c:yellow}2{/c}
'''
    Dado que tenha um ou mais testes com as coordenadas "X=0 Y=1 Z=0" cadastrado
    E que eu selecione o filtro 'coordenadas'
    Quando eu escrever '0 1 0' nos três campos "X Y Z" respectivamente
    E eu clicar no botão 'Pesquisar' 
    Então eu devo ver todos os testes com as coordenadas 'X=0 Y=1 Z=0' cadastrado
'''

#### Cenário: Um usuário pesquisa por um teste utilizando somente a bateria (feliz) - {c:yellow}2{/c}
'''
    Dado que tenha um ou mais testes com robôs com bateria igual a '70%'
    E que eu selecione o filtro 'bateria'
    E selecionar o campo de inserção
    Quando eu inserir um o valor “70” na porcentagem da bateria
    E clicar no botão 'Pesquisar'
    Então eu devo ver todos os testes em que o robô possui a bateria igual a '70%'
'''

#### Cenário: Um usuário pesquisa por um teste utilizando o filtro ativo (feliz) - {c:yellow}3{/c}
'''
    Dado que tenha pelo menos um teste cadastrado no experimento
    E que eu selecione o filtro ‘ativo’ 
    Quando eu selecionar a opção ‘desabilitado’
    E eu clicar no botão ‘Pesquisar’
    Então eu devo ver todos os testes que foram desabilitados no experimento
'''

#### Cenário: Um usuário pesquisa por um teste utilizando somente o filtro ‘status’ (feliz) - {c:yellow}3{/c}
'''
    Dado que exista um ou mais testes cadastrados no experimento
    E que eu selecione o filtro ‘Status’ 
    Quando eu selecionar a opção ‘Aprovado’
    Então eu devo ver todos os testes que foram concluídos sem nenhum erro
'''

#### Cenário: Usuário pesquisa por um teste utilizando somente a bateria (triste) - {c:yellow}2{/c}
'''
	Dado que existem testes associados a bateria,
	Quando eu selecionar a opção filtrar por bateria,
	E selecionar o campo de inserção,
	Quando eu inserir um o valor ‘121’ na porcentagem da bateria,
    E clicar no botão 'Pesquisar',
	Então devo ver uma mensagem de aviso, indicando que o número inteiro só pode ser entre 0 e 100.
'''
	
#### Cenário: Um Usuário pesquisa por um teste utilizando mais de um filtro (feliz) {c:yellow}4{/c}
'''
    Dado que tenha pelo menos um teste cadastrado no experimento,
    E que eu selecione o filtro ‘tag’,
    Quando eu escrever ‘Ciência’ na barra de pesquisa do filtro,
    Então eu devo ver um botão de ‘+’ do lado do filtro ‘tag’,
    Quando eu clicar no botão ‘+’,
    Então devo ver mais uma caixa de seleção de filtro e também outra caixa de seleção ,central com as opções ‘&’ ou ‘Ou’ ,
    Quando eu selecionar a opção ‘Ou’ e o filtro ‘bateria’,
    E inserir um o valor ‘92’ na porcentagem da bateria,
    E clicar no botão ‘Pesquisar’,
    Então devo ver todos os testes que tenham a tag ‘Ciência’ quanto os testes com a bateria em ‘92%’.
'''

#### Cenário: Um usuário pesquisa por um teste utilizando somente um campo do filtro (triste) {c:yellow}1{/c}
'''
    Quando eu escrever no campo de um ou mais filtro/s
    Dado que não tenha nenhum teste com esse/s 'filtro/s' cadastrado
    Quando eu apertar 'enter'
    Então eu devo ver uma mensagem de aviso, indicando que nenhum teste foi encontrado para o/os filtros selecionado/s
'''

