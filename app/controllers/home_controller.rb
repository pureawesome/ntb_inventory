class HomeController < ApplicationController
  def index
    @brews = []
    Product.all.each do |product|
      @brews << get_inventory(product)
    end
    @brews
  end

  private

  def get_inventory(product)
    brewed = get_brewed(product.id)
    sold = get_sold(product.id)
    item = {
      name: product.name,
      brewed: brewed,
      sold: sold,
      total: brewed - sold
    }
    item
  end

  def get_brewed(id)
    Brew.where(product_id: id)
        .select(:amount)
        .map(&:amount)
        .inject(:+)
  end

  def get_sold(id)
    Sale.where(product_id: id)
        .select(:amount)
        .map(&:amount)
        .inject(:+)
  end
end
