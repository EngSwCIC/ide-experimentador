#language pt
Funcionalidade: Parar experimento
    Como um usuário
    Quero poder parar a execução de um experimento

Cenario: Existe um teste de experimento em execução
    Dado que estou logado na minha conta
    E que existe um teste de um experimento em execução
    Quando eu clicar no botão "stopTestButton"
    Então devo ver uma notificação de "Execução de teste interrompida"
    E o teste interrompido deve parar a execução

Cenario: Não existem testes de experimento em execução
    Dado que estou logado na minha conta
    E que não existe nenhum teste de experimento em execução
    Então não deve haver um botão "stopTestButton" disponível