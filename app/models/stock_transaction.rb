class StockTransaction < ApplicationRecord
  belongs_to :stock
  ACTION_TYPES = {exit: 0, entry: 1}
  enum action: ACTION_TYPES
  
  validates :quantity, :user_id, :stock_id,
    numericality: { only_integer: true, greater_than: 0 },
    presence: true

  validate :exit_from_empty_stock, 
    :exit_quantity_greater_than_stock_quantity, 
    :invalid_action_type


  def action=(value)
    value = value.to_s
    unless ACTION_TYPES.include?(value.to_sym)
      @invalid_action_type = true
    else
      value
    end
  end

  def self.aggregate_by_stock
    stocks = Stock.all
    stocks.map do |stock|
      {
        stock: {
          id: stock.id,
          quantity: stock.quantity
        },
        transactions: stock.stock_transactions
      }
    end
  end

  private 

  def invalid_action_type
    if @invalid_action_type
      errors.add(:action, "Invalid action value")
    end
  end

  def exit_from_empty_stock
    if self.stock&.empty? && self.action == 'exit'
      errors.add(:action, 'Exit transaction on a empty stock')
    end
  end

  def exit_quantity_greater_than_stock_quantity
    if self.action == 'exit' && self.stock&.quantity < self.quantity
      errors.add(:quantity, 'Exit quantity greater than quantity in stock')
    end
  end

end
