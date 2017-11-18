class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :edit]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product successfully logged.'
    else
      flash.now[:alert] = 'Product not logged'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product successfully updated.'
    else
      flash.now[:alert] = 'Product not updated'
      render :edit
    end
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :sku)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
