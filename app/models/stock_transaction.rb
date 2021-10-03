class StockTransaction < ApplicationRecord
  belongs_to :stock
  enum action: {exit: 0, entry: 1}

  
  validate :exit_from_empty_stock, :exit_quantity_greater_than_stock_quantity

  def exit_from_empty_stock
    if self.stock.empty? && self.action == 'exit'
      errors.add(:action, 'Exit transaction on a empty stock')
    end
  end

  def exit_quantity_greater_than_stock_quantity
    if self.action == 'exit' && self.stock.quantity < self.quantity
      errors.add(:quantity, 'Exit quantity greater than quantity in stock')
    end
  end

end
