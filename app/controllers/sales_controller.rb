class SalesController < ApplicationController
  def index
    load_sales
  end

  def show
    load_sale
  end

  def new
    build_sale
  end

  def create
    build_sale
    save_sale('Sale successfully logged.') || render(:new)
  end

  def edit
    load_sale
  end

  def update
    load_sale
    build_sale
    save_sale('Sale successfully updated.') || render(:edit)
  end

  private

  def sale_params
    sale_params ||= params[:sale]
    sale_params ? sale_params.permit(:amount, :description, :product_id, :date) : {}
  end

  def build_sale
    @sale ||= sale_scope.build
    @sale.attributes = sale_params
  end

  def load_sales
    @sales ||= sale_scope
  end

  def load_sale
    @sale ||= sale_scope.find(params[:id])
  end

  def save_sale(msg)
    redirect_to @sale, notice: msg if @sale.save
  end

  def sale_scope
    Sale.all
  end
end
