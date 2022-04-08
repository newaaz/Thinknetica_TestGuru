class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  has_many :created_tests, foreign_key: "author_id", class_name: "Test"

  def tests_by_level(level)
    tests.where(level: level)
  end
end
