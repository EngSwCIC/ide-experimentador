Funcionalidade: Visualizar dados de skills do teste executado
    Como um usuário interessado nos resultados dos testes executados,
    Para compreender as skills demonstradas durante um teste,
    Eu quero visualizar os dados de skills associados ao robô.

Cenário: Habilidades do painel de visualização
    Dado que eu executei um teste no simulador,
    Quando visito a página do painel de visualização de competências,
    Então devo ver as competências do robô na execução do teste.

Cenário: Sucesso
    Dado que o robô possui diferentes skills em seu plano local,
    E o avanço do plano depende do sucesso de cada skill,
    Então deve ser informado se houve sucesso na simulação.

Cenário: Falha
    Dado que o robô possui diferentes skills em seu plano local,
    E o avanço do plano depende do sucesso de cada skill,
    Então deve ser informado em qual skill do robô houve falha

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
    E a interface deve detectar os erros nos campos de skills,
    Então impedir/interromper a execução do teste.

Cenário: Navigation
    Dado que há um plano local com a skill "navigation",
    E o campo "parameter" está preenchido com a room e os waypoints de destino,
    E o campo "skill", dentro do campo "local_plan", deve ser preenchido com "navigation"
    Então o robô deve navegar em direção ao local.

Cenário: Approach Person
    Dado que o robô usou "navigation",
    E quer se locomover em direção a alguém,
    E o campo "skill" no "local_plan" deve ser preenchido com "approach_person",
    E o campo "parameter" deve conter "topic" com a pessoa destino,
    Então o robô deve se aproximar da pessoa destino.

Cenário: Authenticate Person
    Dado que o robô usou "approach_person",
    E foi de encontro a uma pessoa,
    E deve autenticar a pessoa em questão,
    E o campo "skill" no "local_plan" deve ser preenchido com "authenticate_person",
    E o campo "parameter" deve conter "topic" com a pessoa a ser autenticada,
    Então a pessoa deve ser autenticada.

Cenário: Approach Robot
    Dado que o robô deve se aproximar de um objeto,
    E o campo "skill" no "local_plan" deve ser preenchido com "approach_robot",
    E o campo "parameter" deve conter "topic" com o objeto de aproximação,
    Então o robô deve se aproximar do objeto.

Cenário: Operate Drawer
    Dado que o robô usou "authenticate_person",
    E deve realizar uma ação sobre a pessoa,
    E o campo "skill" no "local_plan" deve ser preenchido com "operate_drawer",
    Então o campo "parameter" deve conter "action" com "open".

Cenário: Wait Message
    Dado que o robô usou "operate_drawer",
    E o status da mensagem deve, em caso de sucesso, ser recebida,
    Então Operate Drawer deve conter "action" com "close".

Cenário: Send Message
    Dado que há plano local,
    E que o robô usou "operate_drawer",
    E deve enviar uma mensagem à pessoa em questão,
    E o campo "skill" no "local_plan" deve ser preenchido com "send_message",
    E o campo "parameter" deve conter "topic" com a pessoa destinatária da mensagem,
    Então a pessoa deve receber a mensagem.

- Exemplo de Erros nos campos de Skills:
. A skill de navegação possui waypoints ausentes ou inválidos.
. O parâmetro "topic" para a skill "approach_person" não está definido.
. A ação para a skill "operate_drawer" não especifica se é para abrir ou fechar a gaveta.
. Falta informação essencial em uma ou mais skills do plano local.