class Group < ApplicationRecord
  paginates_per 4
  belongs_to :user
  has_many :entities

  validates :name, :icon, presence: true
end
