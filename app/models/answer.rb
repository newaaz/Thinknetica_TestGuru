class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true, length: { in: 2..250 }
  validate :validate_count, on: :create

  private

  def validate_count
    errors.add(:base, "Questions must have between 1 and 4 answers.") if question.answers.count >= 4
  end
end
