class CartsController < ApplicationController
  def show
    @line_items = current_order.line_items
  end

  def checkout
    @order = current_order
    @customer = current_order.customer
    @order.line_items.each(&:save)
    @order.pst_rate = @customer.province.pst
    @order.gst_rate = @customer.province.gst
    @order.hst_rate = @customer.province.hst
    @order.total = (@order.subtotal * @order.pst_rate) + (@order.subtotal * @order.gst_rate) + (@order.subtotal * @order.hst_rate)
    @order.save
    @line_items = current_order.line_items
  end
end
