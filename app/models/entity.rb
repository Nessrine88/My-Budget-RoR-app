class Entity < ApplicationRecord
  paginates_per 4

  has_and_belongs_to_many :groups
  belongs_to :user

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 1 }
end
