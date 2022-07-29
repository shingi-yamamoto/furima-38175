class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.includes(:user).order("created_at DESC")
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

def show
end

def edit
  redirect_to root_path unless current_user == @product.user
end

def update
  if @product.update (product_params)
  redirect_to product_path(@product)
    else
      render :edit
  end
end
  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end