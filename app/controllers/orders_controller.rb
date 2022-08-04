class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_purchase, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
  @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_product
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def order_params
  params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = "sk_test_3a8b083313066898b2192781"
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_product_purchase
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id || @product.order.present?
  end
end
