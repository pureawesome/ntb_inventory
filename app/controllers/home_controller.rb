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
    brewed_f = get_brewed(product.id, :quantity_full)
    sold_f = get_sold(product.id, :quantity_full)
    brewed_s = get_brewed(product.id, :quantity_sample)
    sold_s = get_sold(product.id, :quantity_sample)
    item = {
      name: product.name,
      id: product.id,
      brewed_full: brewed_f,
      sold_full: sold_f,
      total_full: brewed_f - sold_f,
      brewed_sample: brewed_s,
      sold_sample: sold_s,
      total_sample: brewed_s - sold_s
    }
    item
  end

  def get_brewed(id, col)
    Brew.where(product_id: id)
        .select(col)
        .map{|d| d[col]}
        .inject(:+)
  end

  def get_sold(id, col)
    Sale.where(product_id: id)
        .select(col)
        .map{|d| d[col]}
        .inject(:+)
  end
end
