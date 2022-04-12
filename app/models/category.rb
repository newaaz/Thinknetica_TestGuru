class Category < ApplicationRecord
  default_scope { order(:title) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true, length: { in: 2..100 }
end
