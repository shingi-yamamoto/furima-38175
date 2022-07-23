class Product < ApplicationRecord

  # テーブルとのアソシエーション
  belongs_to :user
  has_one :item_purchase

  # アクティブハッシュとのアソシエーション
  belongs_to :category_id
  belongs_to :prefecture_id
  belongs_to :status_id
  belongs_to :cost_id
  belongs_to :days_id

  # active_storageとのアソシエーショ
  has_one_attached :image
end
