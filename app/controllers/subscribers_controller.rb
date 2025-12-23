class SubscribersController < ApplicationController
    allow_unauthenticated_access
    before_action :set_product

    def create
        # 如果該信箱已經訂閱過同一個產品，就不要重複建立
        @product.subscribers.where(subscribers_params).first_or_create
        redirect_to @product , notice: "You are now subscribed."
    end

    private
    def set_product
        @product = Product.find(params[:product_id])
    end

    def subscribers_params
        params.expect(subscriber: [:email])
    end
end
