class Experiment < ApplicationRecord
  # Validações de campos de experimento
  validates :name, presence: true
  validates :disabled, inclusion: { in: [true, false] }

  has_many :user_posts, dependent: :destroy
end
