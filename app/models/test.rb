class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
 
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, length: { in: 2..100 }
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  max_level_of_difficulty = Float::INFINITY
  scope :hard, -> { where(level: 5..max_level_of_difficulty) }

  scope :by_category, -> (category) { joins(:category).where(category: { title: category }) }

  def self.category_tests_titles_desc(category)
    by_category(category).pluck(:title).sort.reverse
  end
end
