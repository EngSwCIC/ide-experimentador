class Simulator < ApplicationRecord
  # Validações de campos de simulador
  validates :name, presence: true
  validates :disabled, inclusion: { in: [true, false] }

  has_many :simulator_experiments, dependent: :destroy
end
