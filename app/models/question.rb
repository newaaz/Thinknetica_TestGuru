class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  scope :corrects, -> { where(correct: true) }

  validates :body, presence: true, length: { in: 6..350 }
end
