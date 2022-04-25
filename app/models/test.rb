class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", inverse_of: :authored_tests

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, length: { in: 2..100 }
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, ->(category) { joins(:category).where(category: { title: category }) }

  def self.category_tests_titles_desc(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
