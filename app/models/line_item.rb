class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def add_item(product_id)
        item = products.where('product_id = ?', product_id).first
    if item
        # increase the quantity of product in cart
        item.quantity + 1
        save
    else
        line_item.products << Item.new(product_id: product_id, quantity: 1)
        product = Product.find(product_id)
        items << product
    end
    save
end
end
