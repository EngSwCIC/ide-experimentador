#language: pt
Funcionalidade: Cadastrar Usuario

Cenario: Cadastro de usuario
Dado que sou um usuario
E eu  acessei a aplicação,
Então eu devo ser capaz de me cadastrar

Cenario: Happy cadastro com sucesso
Dado que Usuário preenche dados válidos no formulário de cadastro
E Usuário clica no botão de enviar os dados
Então Cadastro é criado no banco de dados

Cenario: Sad cadastro invalido
Dado que Usuário preenche dados inválidos (ex: tipo errado) no formulário de cadastro
E Usuário clica no botão de enviar os dados
Então A aplicação informa ao usuário quais campos estão preenchidos erroneamente

Cenario: Sad erro do sistema ao cadastrar
Dado que Usuário preenche dados válidos no cadastro
E Usuário clica no botão de enviar os dados
Então Servidor retorna um erro ao tentar cadastrar o usuário (ex: usuário já existe, erro interno do servidor, erro de conexão com o banco)


Funcionalidade: Excluir Conta

Cenario: Deletar cadastro do banco
Dado que sou um usuario
E eu possuo uma conta,
E estou logado,
Então eu devo ser capaz de excluir minha conta

Cenario: Happy usuario exclui cadastro com sucesso
Dado que Usuário clica no botão de confirmar a exclusão de conta
E Servidor exclui a conta do db
Então Usuário é redirecionado para página de login

Cenario: Sad popup fecha ao cancelar
Dado que Usuário clica no botão de cancelar
Então Popup de confirmação fecha

Cenario: Sad erro do sistema ao excluir cadastro
Dado que Usuário clica no botão de confirmar a exclusão de conta
E Servidor retorna erro ao tentar excluir a conta
Então Mensagem de erro é exibida ao usuário


Funcionalidade: Editar Cadastro

Cenario: Usuario cadastrado
Dado que sou um usuario
E eu possuo uma conta,
E estou logado,
Então eu devo ser capaz de editar o meu cadastro

Cenario: Happy usuario consegue editar cadastro com sucesso
Dado que Usuário digita dado atualizado
E Clica no botão confirma
Então Campo é atualizado

Cenario: Sad cadastro nao e atualizado
Dado que Usuário digita dado novo
E Clica no botão confirma
Entao Campo não é atualizado


Funcionalidade: Resetar Senha

Cenario: Resetar senha do cadastro no banco
Dado que sou um usuario
E eu possuo uma conta,
E não estou logado,
Então eu devo ser capaz de resetar a minha senha

Cenario: Happy usuario muda a senha com sucesso
Dado que Usuário confirma o email
E Recebe no email o link de resert
E Insere nova senha
E Senha atualizada
Então Redireciona para a página de Login

Cenario: Sad usuario digita email inexistente no banco
Dado que Usuário digita o email
Então Email não está cadastrado no banco de dados

Cenario: Sad erro ao enviar o email de recuperacao
Dado que Usuário digita o email
E Email existe no banco de dados
Então Sistema nao envia o email com o link

Cenario: Sad senha nao e alterada
Dado que Usuário recebe o email
E Altera a senha
E Confirma alteração
Então Senha não alterada no banco de dados

