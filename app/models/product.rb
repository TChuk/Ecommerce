class Product < ApplicationRecord
  belongs_to :category
  belongs_to :system

  validates :name, :price, :stock_quantity, :system_id, :category_id, presence: true
  validates :price, numericality: true
  validates :stock_quantity, numericality: true
end
