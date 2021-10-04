class StocksController < ApplicationController
  before_action :authenticate_request!
  load_and_authorize_resource

  #PUT/PATCH /products/1/stocks/1
  def update
    @stock = Product.find(params[:product_id]).stock
    @transaction = @stock.create_stock_transaction(stock_params, @current_user) 

    if @transaction.save
      if @stock.update_quantity(stock_params)
        render json: @stock
      else
        render json: @stock.erros, status: :unprocessable_entity
      end
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private
    def stock_params
      params.require(:stock).permit(:quantity, :action)
    end
end
