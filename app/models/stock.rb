class Stock < ApplicationRecord
  belongs_to :product
  has_many :stock_transactions

  def create_stock_transaction(params, author)
    transaction_params = {
      quantity: params[:quantity],
      stock_id: self.id,
      user_id: author.id
    }

    @transaction = StockTransaction.new(transaction_params)
    @transaction.save
  end


  def update_quantity (params)
    if params[:action] == 'exit'
      new_quantity = self.quantity - params[:quantity]
    else
      new_quantity = self.quantity + params[:quantity]
    end
    self.update(quantity: new_quantity)
  end

  def empty?
    self.quantity == 0
  end

end
