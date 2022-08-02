class OrderForm 
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :prefecture_id, :city, :phone_number, :building_name, :address, :post_code, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
    validates :post_code
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    ProductPurchase.create(order_id: order_id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end