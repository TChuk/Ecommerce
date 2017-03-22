class ProductsController < ApplicationController
  def index
    @products = Product.all
    @systems = System.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def sort
    @products = Product.where(:system_id => params[:id])
    @sortedproducts = Product.where(:category_id => params[:catid])
  end

  def search
  end

  def search_results
    @products = Product.where("name LIKE ?", "%#{params[:keywords]}%")
  end
end
