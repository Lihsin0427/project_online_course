class Course < ApplicationRecord
  # validation
  validates :topic, :currency, :category, :content, presence: true

  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  validates :validity_period, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 31,
    only_integer: true
  }
  validates :is_available, inclusion: { in: [true, false] }, exclusion: { in: [nil] }

  validates :url, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\-]+\z/,
  message: "限小寫英數字及橫線" }

  def to_param
    url
  end
end
