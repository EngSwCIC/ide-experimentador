#language: pt
Funcionalidade: Fazer Login

    @javascript
    Cenario: Usuario loga com sucesso (Happy)
        Dado que Usuário navega para página de login
        E Usuário preenche dados válidos no formulário de login
        E Usuário clica no botão de login
        E Login e validado 
        Então usuário é redirecionado para a homepage, já logado

    @javascript
    Cenario: Usuario tenta logar com email ou senha invalida (Sad)
        Dado que Usuário navega para página de login
        E Usuário preenche email ou senha invalidos
        E Usuário clica no botão de login
        Então Aplicação informa ao usuário que o email ou a senha sao invalidos

    @javascript
    Cenario: Usuario faz logout com sucesso (Happy)
        Dado que usuário esta logado na pagina principal
        E usuário clica em Log out
        Então usuário é redirecionado para página inicial e aplicação informa que usuário foi deslogado

    @javascript
    Cenario: Redireciona usuario nao logado (Happy)
        Dado que Usuário nao esta logado
        E Usuario tenta acessar uma pagina restrita
        Então Redireciona para página de login e mostra mensagem de erro

