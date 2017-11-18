class Product < ApplicationRecord
  has_many :brew
  has_many :sale
end
