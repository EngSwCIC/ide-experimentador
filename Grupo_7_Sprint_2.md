# Projeto Experimentador

Projeto da disciplina de Engenharia de Software da Universidade de Brasília

## 👤 Grupo 7

Engenharia de Software UnB - 2023.2


| Nome completo |  Matrícula |
|-------------|-------------|
| Cristiane Damacena Gonçalves de Oliveira  | 180047906    
| Felipe Dantas Borges   | 202021749   |
| Gustavo Pierre Starling  | 202006420  |
| João Vitor Dickmann   | 211042757   |

## 🎯 Sprint 2

Foram criados componentes para as issues #13 e #14 correspondentes a visuzalização de dados.

Fizemos um parser em um arquivos JavaScript. Cada parser é responsável pela leitura dos logs do projeto respectivos ao componente, tratamento e saída das informações que são utilizadas na visualização. 

O componente PanelBattery corresponde a visualização dos dados da bateria.
O componente PanelLocation conta com um plano cartesiano com o localização do robô conforme as coordenadas.
O componente TableComponent exibe os dados da posição do robô em uma tabela. 

A entrada deverá ser um arquivo com a extensão .log.
Caso existam dados inválidos na entrada, será apresentada uma mensagem de erro.

Para cada componente, existe o respectivo processor:

| Componente |  Parser |
|-------------|-------------|
| PanelBattery  | logProcessorBattery.js |    
| PanelLocation  | logProcessorLocation.js   |
| TableComponent | logProcessorBattery.js  |


##  🚀  Sobre o projeto

O simulador de robôs é um projeto que utiliza coordenadas de um plano cartesiano para o mapeamento de robôs em um 2D. 

O Grupo 7 está responsável por duas issues dentro do projeto:

- [Visualização dos dados de posição do teste executado](https://github.com/EngSwCIC/ide-experimentador/issues/14)
- [Visualização dos dados de bateria do teste executado](https://github.com/EngSwCIC/ide-experimentador/issues/13)

## 🔩 Funcionalidades

Para cada issue, as seguintes funcionalidades serão desenvolvidas:

#### [Issue 13:](https://github.com/EngSwCIC/ide-experimentador/issues/13)

* Funcionalidade: Visualização dos dados de bateria

* Regras de negócio: Exibir na tela de forma gráfica as informações de consumo da bateria;

#### [Issue 14:](https://github.com/EngSwCIC/ide-experimentador/issues/14)

* Funcionalidade: Visualização da posição

* Regras de negócio: 

    * Exibir na tela de forma gráfica toda a movimentaçõa do robô a partir das coordenadas geradas nos logs; 

    * Exibir na tela o ponto onde está o robô considerando a coordenada (x,y);

    * Não alterar a posição do robô na tela caso seja solicitado um fluxo de exceção.

* Fora do escopo: Animação do ponto de indicação do robô.



