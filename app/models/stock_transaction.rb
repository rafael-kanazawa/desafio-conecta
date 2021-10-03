class StockTransaction < ApplicationRecord
  belongs_to :stock
  enum action: {exit: 0, entry: 1}

  validates :action, 
    presence: :true,
    inclusion: { in: ['exit', 'entry'], message: "%{value} is fucking bumb" }
  
  validates :quantity, :user_id, :stock_id,
    numericality: { only_integer: true, greater_than: 0 },
    presence: true

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
