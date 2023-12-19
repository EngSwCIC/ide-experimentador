# Sprint-3
- Foram refatorados os códigos dos métodos da controladora de simuladores.
- Testes RSPEC com cobertura utilizando a lib proposta pela professora.
- BDD utilizando cucumber.
- Testes utilizando Selenium + Capybara.
- Documentação com RDOC.
## BDD utilizando cucumber
```bash
bundle exec cucumber
```
## Acessar documentação de métodos
Para gerar a documentação:
```bash
rdoc app/controllers/simulators_controller.rb
```
Para acessar a página de documentação, entre no diretório doc dentro do projeto e use o comando:
```bash
open index.html
```
## Teste RSPEC com cobertura
```bash
rspec spec
```
## Testes utilizando Selenium + Capybara
```bash
rails test:system
```
