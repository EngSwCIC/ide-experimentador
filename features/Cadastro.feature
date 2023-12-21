#language: pt
Funcionalidade: Cadastrar Usuario\

    @javascript
    Cenario: Cadastro com sucesso (Happy)
        Dado que usuario navega para a pagina de login
        E usuario clica no botao de cadastro
        E Usuário preenche dados válidos no formulário de cadastro
        E Usuário clica no botão de enviar os dados
        Então Cadastro é criado no banco de dados e usuario e redirecionado para home


    @javascript
    Cenario: Cadastro email invalido (Sad)
        Dado que usuario navega para a pagina de login
        E usuario clica no botao de cadastro
        E Usuário preenche email inválido
        E Usuário clica no botão de enviar os dados
        Então A aplicação informa ao usuário email invalido

    
    @javascript
    Cenario: Cadastro senha invalida (Sad)
        Dado que usuario navega para a pagina de login
        E usuario clica no botao de cadastro
        E Usuário preenche senha inválida
        E Usuário clica no botão de enviar os dados
        Então A aplicação informa ao usuário senha invalida

    @javascript
    Cenario: Usuario muda a senha com sucesso (Happy)
        Dado que Usuário possui um cadastro
        E Usuário navega para a pagina de login
        E Usuário clica em recuperar senha
        E Usuário confirma o email
        Então Usuário deve ver mensagem de envio de instrucoes para recuperar senha

    @javascript
    Cenario: Usuario digita email inexistente para recuperar senha (Sad)
        Dado que Usuário navega para a pagina de login
        E Usuário clica em recuperar senha
        E Usuário insere email nao cadastrado
        Então A aplicação informa ao usuário email nao encontrado

