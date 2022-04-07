class Test < ApplicationRecord
  class << self
    def all_by_category(category)
      category_id = Category.find_by(title: category.to_s).id
      Test.where(category_id: category_id).pluck(:title)

      # или всё в одну строку
      #Test.where(category_id: Category.find_by(title: category.to_s).id).pluck(:title)
    end
  end
end
