#language: pt
Funcionalidade: Fazer Login

Cenario: Usuario faz o login
Dado que sou um usuario
E eu possuo uma conta cadastrada,
Então eu devo ser capaz de fazer login


Cenario: Happy Usuario loga com sucesso
Dado que Usuário navega para página de login
E Usuário preenche dados válidos no formulário de login
E Usuário clica no botão de login
Então Credenciais são validadas no db e usuário é redirecionado para a homepage, já logado

Cenario: Sad Usuario nao consegue logar
Dado que Usuário preenche dados inválidos no formulário de login (ex: username não tem formato válido de email)
E Usuário clica no botão de login
Então Aplicação informa ao usuário que houve um erro no preenchimento do formulário

Cenario: Sad Erro ao logar
Dado que Usuário preenche dados válidos no formulário de login
E Usuário clica no botão de login
Então Servidor retorna um erro ao fazer login (ex: usuário não existe, erro interno do servidor, erro de conexão com o db)


Cenario: Usuario logado, faz logout
Dado que sou um usuario
E eu possuo uma conta cadastrada,
E eu estou logado,
Então eu devo ser capaz de fazer logout

Cenario: Happy Usuario faz logout com sucesso
Dado que Servidor desloga o usuário
Então Usuário é redirecionado para página de login

Cenario: Sad erro ao fazer logout
Dado que Servidor retorna erro ao tentar deslogar o usuário
Então Erro é informado ao usuário na aplicação


Cenario: Usuario nao logado
Dado que sou um usuario
E eu nao estou logado,
E eu tento acessar uma pagina restrita,
Então eu devo ser redirecionado para a pagina de login

Cenario: Happy redireciona com sucesso
Dado que Usuário recebe mensagem de erro 
Então Redireciona para página de login

Cenario: Sad usuario nao e barrado
Dado que Ususario nao logou
Então Usuário consegue acessar página mesmo sem logar

Cenario: Sad Usuario nao e redirecionado
Dado que Usuário não consegue logar
Então Não é redirecionado para o login