class User < ApplicationRecord
  def tests_by_level(level)
    user_test_ids = Result.where(user_id: self.id).pluck(:test_id)
    Test.where('id IN (?) AND level = ?', user_test_ids, level)
  end
end
