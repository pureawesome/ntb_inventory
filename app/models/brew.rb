class Brew < ApplicationRecord
  belongs_to :product

  validates :amount_full, presence: true
end
