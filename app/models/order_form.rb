class OrderForm 
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :prefecture_id, :city, :phone_number, :building_name, :address, :post_code, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token

    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :post_code, length: { is: 8 } 
    end
  end
  

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    ProductPurchase.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end