#language pt
Funcionalidade: Executar experimento
    Como um usuário
    Quero poder executar um experimento

Contexto: 
    Dado que estou logado na minha conta
    Entao quero executar um experimento

Cenario: Não estou na página de nenhum experimento
    Dado que existe pelo menos um experimento no menu lateral
    E que não selecionei nenhum experimento para ver os testes
    Quando eu clicar no botão de executar de algum experimento
    Entao quero ver a página desse experimento com os cards
    E o botão de executar deve virar um botão de parar
    E deverão ser executados todos os testes disponíveis, caso existam

Cenario: Estou na página de algum experimento
    Dado que existe pelo menos dois experimentos no menu lateral
    E que estou ná pagina de um experimento
    Quando eu clicar no botão de executar de outro experimento
    Entao quero ver a página desse experimento com os cards
    E o botão de executar dever virar um botão de parar
    E deverão ser executados todos os testes disponíveis, caso existam

Cenario: Experimento sem testes disponíveis
    Dado que existe pelo menos um experimento no menu lateral
    E que estou na página de um experimento
    Quando eu clicar no botão de executar desse determinado experimento
    E não existir testes disponíveis dentro do experimento para a execução
    Entao quero ver o texto "Não há testes disponíveis"


Cenario: Experimento com pelo menos um teste disponível
    Dado que existe pelo menos um experimento no menu lateral
    E que estou na página de um experimento
    Quando eu clicar no botão de executar desse determinado experimento
    E existir pelo menos um teste disponível dentro do experimento
    Entao o botão de executar deve virar um botão de parar
    E deverão ser executados todos os testes disponíveis dentro do experimento