class ProductsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]
    def index
        render json: Product.all
    end

    def show
        product = Product.find(params[:id])
        if production 
            render json: product, status: :ok
        else
            render json:{error: "Product not found"}, status: :not_found
        end
    end

    def create
        product = Product.create(product_params)
        render json: product, status: :created
    end

    private

    def product_params
        params.permit(:name, :description, :image_url, :category, :price, :material, :color, :stock_quantity)
    end
end
