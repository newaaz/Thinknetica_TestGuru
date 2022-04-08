class Test < ApplicationRecord
  belongs_to :category

  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy

  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.titles_by_category_desc(category)
    Category.find_by(title: category).tests.order(id: :desc).pluck(:title)
  end

end
