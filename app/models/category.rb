class Category < ApplicationRecord
  has_many :courses

  # validation
  validates :name, presence: true
end
