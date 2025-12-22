class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  before_action :set_product , only: %i[show edit update destroy]

  def index
    @products = Product.all # 叫管理員把所有產品拿出來，存進變數 @products
  end

  def show
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      # redirect_to product_path(@product.id)
      # redirect_to product_path(@product)
      redirect_to @product 
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
      if @product.update(product_params)
        redirect_to @product
      else
        render :edit , status: :unprocessable_entity
      end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.expect(product: [:name])
  end
end
