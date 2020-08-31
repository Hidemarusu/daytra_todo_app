class Task < ApplicationRecord
  validates :title, length: {maximum: 20}, presence: true, uniqueness: true

  belongs_to :user
end