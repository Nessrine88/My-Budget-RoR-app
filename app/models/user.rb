class User < ApplicationRecord
  has_many :entities
  has_many :groups
  has_many :entities, through: :groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
