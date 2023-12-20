# Sprint 1

A primeira Sprint tem como objetivo definir as histórias de usuário para a [issue #10](https://github.com/EngSwCIC/ide-experimentador/issues/10) do projeto [ide-experimentador](https://github.com/EngSwCIC/ide-experimentador), em que o usuário do aplicativo ide-experimentador deve conseguir visualizar os testes dos experimentos de forma dinâmica, como cards.

O design dos componentes a serem desenvolvidos em código pode ser acessado pelo [Figma](https://www.figma.com/file/foPO4h8s3THREEZ0Pua1qZ/Untitled?type=design&node-id=1-2&mode=design&t=Ay3TD74TG27ZbrRp-0).

## Equipe responsável

- Amanda Leite 18/0115481
- Giovanni Minari 20/2014280
- Leonardo Ramos 21/1010360
- Maria Claudia 17/0109968
- Rodrigo Vieira 23/2036466

**Scrum Master:** Maria Claudia

**Product Owner:** Giovanni Minari

## Funcionalidades

1. Renderização gráfica de cards dos testes de um experimento com os campos e botões:

   - nome do experimento
   - status do experimento
   - botão para executar
   - botão para selecionar
   - botão para abrir modal de 'mais detalhes'
   - fatores do teste (estado da bateria, coordenadas, skills, entre outros)
   - tags do teste

   > Regras de negócio:
   >
   > - O usuário não pode executar um teste já executado
   > - O usuário pode executar o experimento com um todo incluindo apenas os testes selecionados
   > - O usuário pode parar a execução de um teste que está executando

   > Pontos: 4
   >
   > - Um ponto por conta de pegar os dados do teste do backend
   > - Um ponto por conta de criar o card sem troca dos estados dos ícones
   > - Um ponto por conta de trocar o estado dos icones e tags
   > - Um ponto para criar lista de skill retrátil e dropdown para mais opções

   > Responsável(eis): Amanda, Maria Claudia, Leonardo

2. Renderização gráfica de modal de 'mais detalhes' com quatro páginas vazias e um botão para fechar

   > Regras de negócio:
   >
   > - O usuário deve conseguir acessar as outras páginas
   > - O usuário deve conseguir retornar para a página do experimento em que estava antes de abrir o modal

   > Pontos: 2
   >
   > - Um ponto para criar a estrutura do modal e que ele abre e fecha
   > - Um ponto para criar as paginas dentro do modal

   > Responsável(eis): Giovanni, Rodrigo

## Política de branching

Branch por issue.

## Como executar o projeto

Depois de instalar as depências com

`bundle install `

e

`yarn install `

O projeto pode ser executado localmente com

`bin/dev`

Para acessar a página de demonstração, a rota `experiments/` deve ser acessada
