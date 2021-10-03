class StocksController < ApplicationController
  before_action :authenticate_request!

  #PUT/PATCH /products/1/stocks
  def update
    @stock = Product.find(params[:id]).stock
    if @stock.create_stock_transaction(stock_params, @current_user)
      if @stock.update_quantity(stock_params)
        render json: @stock
      else
        render json: @stock.erros, status: :unprocessable_entity
      end
    else
      render json: @transaction.erros, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:quantity, :action)
    end
end
