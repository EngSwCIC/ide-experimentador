class Experiment < ApplicationRecord
  validates :name, presence: true
  validates :disabled, inclusion: { in: [true, false] }

  has_many :user_posts, dependent: :destroy
end
