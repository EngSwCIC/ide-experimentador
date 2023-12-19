# Classe responsável por controlar os os pedidos para a pagina de bateria.
class BatteryController < ApplicationController
    skip_forgery_protection

    # Renderiza a página de bateria.
    #
    # ==== Descrição
    # Este método renderiza a página de bateria.
    #
    # ==== Argumentos
    # Nenhum argumento é necessário.
    def index
        render
    end    

    # Obtém todos os registros de execução de teste.
    #
    # ==== Descrição
    # Este método busca e retorna o registro mais recente de execução de teste para os IDs.
    #
    # ==== Argumentos
    # Nenhum argumento é necessário.
    #
    # ==== Retorna
    # Retorna um objeto JSON representando o registro mais recente de execução de teste.
    #
    # ==== Efeitos colaterais
    # Nenhum efeito colateral significativo. Apenas retorna dados em formato JSON.
    def get_all
        x = TrialExecution.where(id: TrialExecution.group(:trial_id).maximum(:id).values)
        render json: x
      end

end
