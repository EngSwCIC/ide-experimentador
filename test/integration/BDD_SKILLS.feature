Funcionalidade: Visualizar dados de skills do teste executado
    Como um usuário interessado nos resultados dos testes executados,
    Para compreender as skills demonstradas durante um teste,
    Eu quero visualizar os dados de skills associados ao robô.

Contexto:
    Dado que eu executei um teste no simulador,
    Então eu deveria ver as skills do robô no teste executado.

Cenário: Sucesso e Falha
    Dado que o robô possui diferentes skills em seu plano local,
    E o avanço do plano depende do sucesso de cada skill,
    Então deve ser informado em qual skill do robô houve falha ou,
    Então deve ser informado se houve sucesso na simulação.

Cenário: Observação do tempo na execução do teste
    Dado que o usuário analisa os logs de execução do teste,
    E observa o campo de registro de tempo em cada entrada de log,
    Então o usuário observa, além do sucesso e falha, em que momento uma skill é alterada.

Cenário: Visualizar skills sem executar simulação
    Dado que o usuário tenta acessar a visualização de skills sem executar a simulação,
    Então a interface fornece uma mensagem de erro.

Cenário: Robô sem skills 
    Dado que um robô é selecionado para visualização de dados de skills,
    E este robô não possui skills atribuídas,
    Então a interface deve indicar que não há skills disponíveis para o robô.

Cenário: Campos das skills não preenchidos corretamente
    Dado que um robô possui um plano local associado,
    E o plano local contém informações incorretas ou campos de skills mal preenchidos,
    Quando o usuário executa um teste com esse robô,
    Então a interface deve detectar os erros nos campos de skills,
    E impedir/interromper a execução do teste.

Cenário: Navigation
    Dado que há um plano local com a skill "navigation",
    E o campo "parameter" está preenchido com a room e os waypoints de destino,
    Então o campo "skill", dentro do campo "local_plan", deve ser preenchido com "navigation"
    Então o robô deve navegar em direção ao local.

Cenário: Approach Person
    Dado que o robô usou "navigation",
    E quer se locomover em direção a alguém,
    Então o campo "skill" no "local_plan" deve ser preenchido com "approach_person",
    E o campo "parameter" deve conter "topic" com a pessoa destino,
    E o robô deve se aproximar da pessoa destino.

Cenário: Authenticate Person
    Dado que o robô usou "approach_person",
    E foi de encontro a uma pessoa,
    E deve autenticar a pessoa em questão,
    Então o campo "skill" no "local_plan" deve ser preenchido com "authenticate_person",
    E o campo "parameter" deve conter "topic" com a pessoa a ser autenticada,
    E a pessoa deve ser autenticada.

Cenário: Approach Robot
    Dado que o robô deve se aproximar de um objeto,
    Então o campo "skill" no "local_plan" deve ser preenchido com "approach_robot",
    E o campo "parameter" deve conter "topic" com o objeto de aproximação,
    E o robô deve se aproximar do objeto.

Cenário: Operate Drawer
    Dado que o robô usou "authenticate_person",
    E deve realizar uma ação sobre a pessoa,
    Então o campo "skill" no "local_plan" deve ser preenchido com "operate_drawer",
    E o campo "parameter" deve conter "action" com "open".

Cenário: Wait Message
    Dado que o robô usou "operate_drawer",
    Então o status da mensagem deve, em caso de sucesso, ser recebida,
    E Operate Drawer deve conter "action" com "close".

Cenário: Send Message
    Dado que há plano local,
    E que o robô usou "operate_drawer",
    E deve enviar uma mensagem à pessoa em questão,
    Então o campo "skill" no "local_plan" deve ser preenchido com "send_message",
    E o campo "parameter" deve conter "topic" com a pessoa destinatária da mensagem,
    E a pessoa deve receber a mensagem.

- Exemplo de Erros nos Campos de Skills:
. A skill de navegação possui waypoints ausentes ou inválidos.
. O parâmetro "topic" para a skill "approach_person" não está definido.
. A ação para a skill "operate_drawer" não especifica se é para abrir ou fechar a gaveta.
. Falta informação essencial em uma ou mais skills do plano local.
