class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :product_purchase
end
