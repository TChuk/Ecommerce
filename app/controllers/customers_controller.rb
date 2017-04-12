class CustomersController < ApplicationController
  def show
    @customer = current_user.customer
  end

  def create
    @order = current_order
    @customer = order.customer.new
  end

  def update
  end

  def destroy
  end
end
