class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page]).per(3)
    @systems = System.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    if @product.stock_quantity < 5
      quantity_adjustment = 1.15
    else
      quantity_adjustment = 1
    end
    @tradeinvalue = (@product.price * 0.3) * quantity_adjustment
  end

  def sort
    @products = Product.where(:system_id => params[:id])
    @sortedproducts = Product.where(:category_id => params[:catid])
  end

  def search
  end

  def search_results
    system_params = params[:system_id]
    @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
    unless system_params.empty? || system_params.nil?
      @products = @products.where("system_id = ?", system_params)
    end
  end
end
