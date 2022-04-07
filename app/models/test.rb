class Test < ApplicationRecord
  def self.titles_by_category_desc(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', category )
      .order(id: :desc)
      .pluck(:title)
  end
end
