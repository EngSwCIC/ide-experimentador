#language pt
Funcionalidade: Parar testes por tags
    Como um usuário
    Quero poder parar testes por tags

Cenario: Existe pelo menos um teste com tag em execução
    Dado que eu estou logado na minha conta
    E que existe pelo menos um teste com tag de um experimento em execução
    Então deve haver um botão "stopTestsByTagButton"

Cenario: Existe pelo menos um teste com tag em execução
    Dado que eu estou logado na minha conta
    E que existe pelo menos um teste com tag de um experimento em execução
    E que há um botão "stopTestsByTagButton"
    Quando eu clicar no botão "stopTestsByTagButton"
    Então devo ver uma notificação de "Execução de teste(s) da tag interrompida"
    E a execução de todos os testes com a tag deve ser interrompida

Cenario: Não existem testes com tag em execução
    Dado que eu estou logado na minha conta
    E que não existe nenhum teste com tag de um experimento em execução
    Então não deve haver um botão "stopTestsByTagButton" disponível