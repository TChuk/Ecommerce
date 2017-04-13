class CustomersController < ApplicationController
  def show
    @customer = current_user.customer
  end

  def new
    @customer = Customer.new
  end

  def create
    @order = current_order
    @customer = @order.build_customer(customer_params)
    if (@customer.save)
      session[:customer_id] = @customer.id
      redirect_to(checkout_url, fallback_location: root_path)
    end
  end

  def update
  end

  def destroy
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :postal_code, :email, :province_id)
  end
end
