class Stock < ApplicationRecord
  belongs_to :product
  has_many :stock_transactions

  validates :quantity, :product_id,
    numericality: { only_integer: true, greater_than: 0 },
    presence: true

  def create_stock_transaction(params, author)
    StockTransaction.new({
      quantity: params[:quantity],
      stock_id: self.id,
      user_id: author.id,
      action: params[:action] 
    })
  end

  def update_quantity (params)
    if params[:action]
      if params[:action] == 'exit'
        new_quantity = self.quantity - params[:quantity]
      else
        new_quantity = self.quantity + params[:quantity]
      end
      self.update(quantity: new_quantity)
    end
  end

  def empty?
    self.quantity == 0
  end

end
