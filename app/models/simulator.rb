class Simulator < ApplicationRecord
  validates :name, presence: true
  validates :disabled, inclusion: { in: [true, false] }

  has_many :simulator_experiments, dependent: :destroy
end
