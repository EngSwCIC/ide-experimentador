Funcionalidade: Visualizar dados de velocidade
    Como um usuário Eu quero poder visualizar dados de velocidade do teste executado

Contexto:
    Dado que eu clico no botão de velocidade
    Então eu deveria ver os dados de velocidade do teste executado

Cenário: Teste não executado
    Dado que o teste nunca foi executado
    Então não deve ser possível visualizar os dados

Cenário: Teste concluído com sucesso
    Dado que o teste foi executado com sucesso
    Então eu deveria ver em um gráfico as informações sobre velocidade que foram coletadas durante a execução do teste

Cenário: Teste concluído com falha
    Dado que o teste foi executado com sucesso
    Então eu deveria ter a visualização da falha

Cenário: Falha na coleta de dados
    Dado que o teste foi executado
    E as informações sobre velocidade estão ausentes
    Então o aplicativo deve infromar uma falha
