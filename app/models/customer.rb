class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :orders
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
