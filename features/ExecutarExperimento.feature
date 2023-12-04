#language pt
Funcionalidade: Executar experimento
    Como um usuário
    Quero poder executar um experimento

Contexto: 
    Dado que estou logado na minha conta
    Entao quero executar um experimento

Cenario: Experimento sem testes disponíveis
    Dado que estou na página de um experimento
    Quando eu clicar no botão de executar desse determinado experimento
    E não existir testes disponíveis dentro do experimento para a execução
    Entao quero ver o texto "Não há testes disponíveis"


Cenario: Experimento com pelo menos um teste disponível
    Dado que estou na página de um experimento
    Quando eu clicar no botão de executar desse determinado experimento
    E existir pelo menos um teste disponível dentro do experimento
    Entao o botão de executar deve virar um botão de parar
    E deverão ser executados todos os testes disponíveis dentro do experimento