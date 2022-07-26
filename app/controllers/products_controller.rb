class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@products = Product.includes(:user).order("created_at DESC")
    #@products = Product.order("created_at DESC")
    #@products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end