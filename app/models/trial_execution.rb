# A classe TrialResult representa o resultado de um teste experimental.
class TrialResult
  # @!attribute [r] status
  #   @return [String] O status do teste (sucesso, falha, etc.).
  attr_reader :status

  # @!attribute [r] position_x
  #   @return [String] A posição x do teste.
  attr_reader :position_x

  # @!attribute [r] position_y
  #   @return [String] A posição y do teste.
  attr_reader :position_y

  # @!attribute [r] battery
  #   @return [String] O nível da bateria durante o teste.
  attr_reader :battery

  # Inicializa uma nova instância de TrialResult.
  #
  # @param data [TrialResultInfo] Os dados do resultado do teste.
  def initialize(data)
    @position_x = "-"
    @position_y = "-"
    @battery = "-"
    @status = process_status(data.status)
    process_log(data.log) if data.log
  end

  private

  # Processa o status, substituindo por "N/A" se estiver vazio ou nulo.
  #
  # @param status [String, nil] O status a ser processado.
  # @return [String] O status processado.
  def process_status(status)
    (status.nil? || status.match("^\s*$")) ? "N/A" : status
  end

  # Processa o log para extrair valores específicos.
  #
  # @param log [String] O log a ser processado.
  def process_log(log)
    @position_x = extract_value(log, "'x'")
    @position_y = extract_value(log, "'y'")
    @battery = extract_value(log, "'battery-level'")
  end

  # Extrai um valor específico do log usando uma chave.
  #
  # @param log [String] O log a ser analisado.
  # @param key [String] A chave para a qual extrair o valor.
  # @return [String, nil] O valor extraído, ou nil se não for encontrado.
  def extract_value(log, key)
    match = log.match(".*#{key}:\s*(.+?)(,|})")
    match ? match[1] : "-"
  end
end

# A classe TrialExecution representa a execução de um teste experimental.
# class TrialExecution < ApplicationRecord
#   belongs_to :trial
# end
