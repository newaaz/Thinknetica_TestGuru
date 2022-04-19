class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :body, presence: true, length: { in: 6..350 }
end
