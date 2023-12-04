#language pt
Funcionalidade: Executar teste por tags
    Como um usuário
    Quero poder executar um teste por tags

Contexto: 
    Dado que estou logado na minha conta
    E estou na tela de experimentos
    Entao quero executar um teste de um experimento por tags

Cenario: Criar tags em um teste
    Dado que existe pelo menos um teste no experimento
    E que estou na página do teste
    Quando eu clicar no DropDown de tags
    E existirem tags disponíveis
    Entao quero poder selecionar uma tag para o teste
    
Cenario: Não existem testes com tags
    Dado que existe pelo menos um experimento no menu lateral
    E que estou na página de um experimento
    Quando eu clicar no botão de tags e filtrar
    Entao quero executar os teste com aquelas tags
    E não existir testes com as tags selecionadas disponíveis
    Então quero ver o texto "Não existem testes com as tags selecionadas"

Cenario: Existem testes com tags
    Dado que existe pelo menos um experimento no menu lateral
    E que estou na página de um experimento
    Quando eu clicar no botão de tags e filtrar
    E existir pelo menos um teste com as tags selecionadas
    Quando eu clicar no botão de executar testes
    Entao quero executar os teste com aquelas tags
    E deverão ser executado todos os testes daquelas tags

