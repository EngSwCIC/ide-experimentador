# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Integração entre Elysia e Rails

## Configuração Inicial

### Elysia

1. Acesse a pasta `api-engsw` dentro do projeto "experimentador".

2. Inicie o servidor de desenvolvimento Elysia:
   ```bash
   bun run dev
   ```

3. Abra http://localhost:3001/ no navegador para visualizar o resultado.

### Rails

1. Navegue até a pasta do seu projeto Rails "experimentador".

2. Instale as gemas necessárias:
   ```bash
   bundle install
   ```

3. Inicie o servidor Rails:
   ```bash
   rails s
   ```

4. Abra http://localhost:3000/ no navegador para visualizar o resultado.

## Integração de Rotas

### Elysia

- **Endpoint para Iniciar os Testes:**
  - **Método:** POST
  - **Rota:** `/run`
  - **Exemplo de Requisição:**
    ```bash
    curl -X POST http://localhost:3001/run -H 'Content-Type: application/json' -d @../../../../../exemploCurtoReq.json
    ```

- **Endpoint para Verificar o Status do Teste:**
  - **Método:** GET
  - **Rota:** `/status/:id`
  - **Exemplo de Requisição:**
    ```bash
    curl http://localhost:3001/status/1
    ```

- **Endpoint para Parar um Teste:**
  - **Método:** DELETE
  - **Rota:** `/stop/:id`
  - **Exemplo de Requisição:**
    ```bash
    curl -X DELETE http://localhost:3001/stop/1
    ```

### Rails

- **Endpoint para Iniciar os Testes:**
  - **Método:** POST
  - **Rota:** `/start_tests`
  - **Exemplo de Requisição:**
    ```ruby
    # Faça a requisição usando RestClient ou outra biblioteca de sua escolha
    ```

- **Endpoint para Verificar o Status do Teste:**
  - **Método:** GET
  - **Rota:** `/check_status/:id`
  - **Exemplo de Requisição:**
    ```ruby
    # Faça a requisição usando RestClient ou outra biblioteca de sua escolha
    ```

- **Endpoint para Parar um Teste:**
  - **Método:** DELETE
  - **Rota:** `/stop_test/:id`
  - **Exemplo de Requisição:**
    ```ruby
    # Faça a requisição usando RestClient ou outra biblioteca de sua escolha
    ```

## Observações

Certifique-se de ajustar os exemplos de requisição conforme necessário para se adequar à estrutura específica do seu projeto. Consulte a documentação do Elysia e do Rails para obter detalhes adicionais sobre configuração e rotas.

**Nota:** Lembre-se de substituir `../../../../../exemploCurtoReq.json` pelo caminho real do seu arquivo JSON, considerando a estrutura do seu projeto.