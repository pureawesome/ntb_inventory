class Brew < ApplicationRecord
  belongs_to :product

  validates :amount, presence: true
end
