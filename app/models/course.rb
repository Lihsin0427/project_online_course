class Course < ApplicationRecord
  # validation
  validates :topic, :currency, :category, :url, :content, presence: true

  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  validates :validity_period, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 31,
    only_integer: true
  }
end
