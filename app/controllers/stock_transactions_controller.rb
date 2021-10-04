class StockTransactionsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_stock_transaction, only: [:show, :destroy]

  # GET /stock_transactions
  def index
    @stock_transactions = StockTransaction.all

    render json: @stock_transactions
  end

  # GET /stock_transactions/1
  def show
    render json: @stock_transaction
  end

  # DELETE /stock_transactions/1
  def destroy
    @stock_transaction.destroy
  end

  private

    def set_stock_transaction
      @stock_transaction = StockTransaction.find(params[:id])
    end
end
