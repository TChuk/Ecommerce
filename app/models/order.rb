class Order < ApplicationRecord
  belongs_to :customer
  has_many :line_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    line_items.collect { |li| li.valid? ? (li.quantity * li.price) : 0 }.sum
  end
  private
  def set_order_status
    self.status = "In Progress"
  end

    def update_subtotal
      self[:subtotal] = subtotal
    end
  end
