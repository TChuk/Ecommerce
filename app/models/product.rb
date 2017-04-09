class Product < ApplicationRecord
  belongs_to :category
  belongs_to :system
  has_many :line_items

  validates :name, :price, :stock_quantity, :system_id, :category_id, presence: true
  validates :price, numericality: true
  validates :stock_quantity, numericality: true

  mount_uploader :image, ImageUploader

  def trade_in_value
    quantity_adjustment =
      if stock_quantity < 5
        1.15
      elsif stock_quantity > 10
        0.8
      else
        1
      end
    (price * 0.3) * quantity_adjustment
  end

  def calc_price
    new_price =
      if category_id == 1
        price
      else
        price * 0.9
      end
    new_price
  end
end
