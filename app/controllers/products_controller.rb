class ProductsController < ApplicationController
  before_action :initialize_session
  def index
    @products = Product.order(:name).page(params[:page]).per(6)
    @systems = System.all
    @categories = Category.all
    @order = current_order
    @line_items = current_order.line_items.new
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

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to :back
  end

  private

  def initialize_session
    #session[:order_id] ||= 2
  end
end
