class Recipe < ApplicationRecord
  MARK = (1..5)

  has_many :steps, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  validates :rating, inclusion: { in: MARK }
end
