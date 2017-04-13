class CartsController < ApplicationController
  after_action :new_order, only: [:checkout]

  def show
    @order = current_order
    @line_items = current_order.line_items
  end

  def checkout
    @order = current_order
    @customer = current_order.customer
    @order.line_items.each(&:save)
    @order.customer = current_customer
    @order.status = "Completed"
    @order.pst_rate = @order.customer.province.pst
    @order.gst_rate = @order.customer.province.gst
    @order.hst_rate = @order.customer.province.hst
    @order.total = @order.subtotal + (@order.subtotal * @order.pst_rate) + (@order.subtotal * @order.gst_rate) + (@order.subtotal * @order.hst_rate)
    @order.save
    session[:order_id] = session[:order_id] + 1
    @line_items = current_order.line_items
  end

  private

  def new_order
    @order = Order.new
    session[:order_id] = @order.id
    @line_items = current_order.line_items
  end
end
