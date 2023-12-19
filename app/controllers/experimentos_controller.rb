class ExperimentosController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'json-schema'

  API_BASE_URL = 'http://localhost:3001'.freeze

  def start_tests
    # Verifica se o arquivo JSON existe e possui o formato esperado
    test_data = read_and_validate_test_data('../../../../../exemploCurtoReq.json')
    return render json: { error: 'Invalid test data format' }, status: :unprocessable_entity unless test_data

    # Valida o formato do corpo da solicitação usando JSON Schema
    unless json_schema_valid?(test_data)
      return render json: { error: 'Invalid JSON schema for test data' }, status: :unprocessable_entity
    end

    # Fazendo a solicitação POST para a API externa para iniciar os testes
    begin
      response = RestClient.post "#{API_BASE_URL}/run", test_data.to_json, content_type: :json
      result = JSON.parse(response.body)
      render json: result
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.response.body }, status: e.response.code
    end
  end

  def check_status
    test_id = params[:id]

    # Verifica se o ID do teste é um número inteiro
    return render json: { error: 'Invalid test ID' }, status: :unprocessable_entity unless test_id.match?(/^\d+$/)

    # Fazendo a solicitação GET para a API externa para verificar o status do teste
    begin
      response = RestClient.get "#{API_BASE_URL}/status/#{test_id}"
      result = JSON.parse(response.body)
      render json: result
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.response.body }, status: e.response.code
    end
  end

  def stop_test
    test_id = params[:id]

    # Verifica se o ID do teste é um número inteiro
    return render json: { error: 'Invalid test ID' }, status: :unprocessable_entity unless test_id.match?(/^\d+$/)

    # Fazendo a solicitação DELETE para a API externa para parar o teste
    begin
      response = RestClient.delete "#{API_BASE_URL}/stop/#{test_id}"
      result = JSON.parse(response.body)
      render json: result
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.response.body }, status: e.response.code
    end
  end

  private

  def read_and_validate_test_data(file_path)
    return nil unless File.exist?(file_path)

    begin
      test_data = JSON.parse(File.read(file_path))
      return test_data
    rescue JSON::ParserError => e
      return nil
    end
  end

  def json_schema_valid?(data)
    schema = {
      "type" => "object",
      "properties" => {
        "log" => { "type" => "string" },
        "nurses" => {
          "type" => "array",
          "items" => {
            "type" => "object",
            "properties" => {
              "location" => { "type" => "string" },
              "position" => { "type" => "object", "properties" => coordinates_schema },
            },
            "required" => ["location", "position"],
          },
        },
        "startTime" => { "type" => "number" },
        "duration" => { "type" => "number" },
        "robots" => {
          "type" => "array",
          "items" => {
            "type" => "object",
            "properties" => {
              "id" => { "type" => "number" },
              "avg_speed" => { "type" => "number" },
              "battery_charge" => { "type" => "number" },
              "battery_discharge_rate" => { "type" => "number" },
              "name" => { "type" => "string" },
              "location" => { "type" => "string" },
              "skills" => { "type" => "array", "items" => { "type" => "string" } },
              "local_plan" => {
                "type" => "array",
                "items" => {
                  "type" => "object",
                  "properties" => {
                    "skill" => { "type" => "string" },
                    "params" => { "type" => "array" }, # Adapte conforme necessário
                    "label" => { "type" => "string" },
                  },
                  "required" => ["skill", "params", "label"],
                },
              },
              "position" => { "type" => "object", "properties" => coordinates_schema },
            },
            "required" => ["id", "avg_speed", "battery_charge", "battery_discharge_rate", "name", "location", "skills", "local_plan", "position"],
          },
        },
      },
      "required" => ["log", "nurses", "startTime", "duration", "robots"],
    }

    JSON::Validator.validate(schema, data)
  end

  def coordinates_schema
    {
      "x" => { "type" => "number" },
      "y" => { "type" => "number" },
      "z" => { "type" => "number" },
    }
  end
end
