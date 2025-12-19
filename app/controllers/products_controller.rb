class ProductsController < ApplicationController
  def index
    @products = Product.all # 叫管理員把所有產品拿出來，存進變數 @products
  end
end
