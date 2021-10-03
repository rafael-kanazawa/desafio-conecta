class Product < ApplicationRecord
  has_one :stock, dependent: :destroy

  def self.register params
    quantity = params[:quantity]
    params.delete :quantity
    
    @product = Product.new(params)
    if @product.save
      @stock = Stock.new(product: @product, quantity: quantity)

      if @stock.save
        return @product
      else
        @product.destroy
        return @stock  
      end
    else
      return @product
    end
  end
end
