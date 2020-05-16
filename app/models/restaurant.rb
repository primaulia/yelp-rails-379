class Restaurant < ApplicationRecord
  # validation
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: %w(chinese italian japanese french belgian) }

  # relationship
  has_many :reviews, dependent: :destroy
end
