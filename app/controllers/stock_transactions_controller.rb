class StockTransactionsController < ApplicationController
  before_action :set_stock_transaction, only: [:show, :update, :destroy]

  # GET /stock_transactions
  def index
    @stock_transactions = StockTransaction.all

    render json: @stock_transactions
  end

  # GET /stock_transactions/1
  def show
    render json: @stock_transaction
  end

  # POST /stock_transactions
  def create
    @stock_transaction = StockTransaction.new(stock_transaction_params)

    if @stock_transaction.save
      render json: @stock_transaction, status: :created, location: @stock_transaction
    else
      render json: @stock_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stock_transactions/1
  def update
    if @stock_transaction.update(stock_transaction_params)
      render json: @stock_transaction
    else
      render json: @stock_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stock_transactions/1
  def destroy
    @stock_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_transaction
      @stock_transaction = StockTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_transaction_params
      params.require(:stock_transaction).permit(:stock_id, :quantity, :action)
    end
end
