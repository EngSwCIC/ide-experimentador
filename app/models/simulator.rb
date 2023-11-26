class Simulator < ApplicationRecord
  validates :name, presence: true
  validates :disabled, inclusion: { in: [true, false] }

end
