class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  has_many :created_tests, foreign_key: "author_id", class_name: "Test"

  validates :name, presence: true, length: { in: 2..100 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255, minimum: 6 },
                                    format: {with: VALID_EMAIL_REGEX, message: "Invalid email"},
                                    uniqueness: {case_sensitive: false}

  def tests_by_level(level)
    tests.where(level: level)
  end
end
