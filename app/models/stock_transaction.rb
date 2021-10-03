class StockTransaction < ApplicationRecord
  belongs_to :stock
  enum action: {exit: 0, entry: 1}

  validates :exit_from_empty_stock

  def exit_from_empty_stock
    not(self.stock.empty? && self.action == :exit)
  end

end
