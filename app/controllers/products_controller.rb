class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @respose = Product.register(initial_product_params)
    if @respose.erros.any?
      render json: @respose.errors, status: :unprocessable_entity  
    else
      render json: @respose, status: :created, location: @respose
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def initial_product_params
      params.require(:product).permit(:name, :description, :price, :stock_id, :quantity)
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock_id)
    end
end
