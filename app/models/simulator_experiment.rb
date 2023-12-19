class SimulatorExperiment < ApplicationRecord
  # Validações de campos de simulador-experimento
  validates :simulator_id, presence: true
  validates :experiment_id, presence: true

  belongs_to :simulator
  belongs_to :experiment
end
