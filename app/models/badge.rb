class Badge < ApplicationRecord
  enum rule_name: { category: 0, level: 1, first_attempt: 2 }

  validates :title, :image, :rule_name, :rule_value, presence: true

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
