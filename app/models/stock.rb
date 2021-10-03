class Stock < ApplicationRecord
  has_one :product
  has_many :stock_transactions
end
