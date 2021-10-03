class Stock < ApplicationRecord
  belongs :product
  has_many :stock_transactions
end
