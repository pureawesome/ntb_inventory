class Brew < ApplicationRecord
  belongs_to :product

  validates :quantity_full, presence: true
end
