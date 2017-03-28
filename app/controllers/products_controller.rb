class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page]).per(6)
    @systems = System.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def sort
    @products = Product.where(system_id: params[:id]).order(:name)
    @sortedproducts = Product.where(category_id: params[:catid]).order(:name)
  end

  def search_results
    system_params = params[:system_id]
    @products = Product.where('name LIKE ?', "%#{params[:keywords]}%")
    @products = @products.where('system_id = ?', system_params) \
    unless system_params.empty? || system_params.nil?
    @products = @products.order(:name)
  end
end
