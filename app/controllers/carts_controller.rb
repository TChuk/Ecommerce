class CartsController < ApplicationController
  def show
    @line_items = current_order.line_items
  end

  def checkout
    @customer = current_user
  end
end
