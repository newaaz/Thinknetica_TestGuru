class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"

  validates :name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, length: { maximum: 255, minimum: 6 },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" },
                    uniqueness: { case_sensitive: false }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
