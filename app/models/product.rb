class Product < ApplicationRecord
  belongs_to :category
  belongs_to :system

  validates :name, :price, :stock_quantity, :system_id, :category_id, presence: true
  validates :price, numericality: true
  validates :stock_quantity, numericality: true

  mount_uploader :image, ImageUploader

  def trade_in_value
    if stock_quantity < 5
      quantity_adjustment = 1.15
    elsif stock_quantity > 10
      quantity_adjustment = 0.8
    else
      quantity_adjustment = 1
    end

    (price * 0.3) * quantity_adjustment
  end

  def calc_price
    if category_id == 1
      new_price = price
    else
      new_price = price * 0.9
    end
    new_price
  end
end
