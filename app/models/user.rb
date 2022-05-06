class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy

  before_save :downcase_email

  has_many :authored_tests, foreign_key: "author_id", class_name: "Test", inverse_of: :author, dependent: :destroy

  validates :name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, length: { maximum: 255, minimum: 6 },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" },
                    uniqueness: { case_sensitive: false }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
