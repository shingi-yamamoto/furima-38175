class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank" }
  validates :title, :text, presence: true

  # テーブルとのアソシエーション
  belongs_to :user
  has_one :item_purchase

  # アクティブハッシュとのアソシエーション
  belongs_to :category_id
  belongs_to :prefecture_id
  belongs_to :status_id
  belongs_to :cost_id
  belongs_to :delivery_days_id

  # active_storageとのアソシエーショ
  has_one_attached :image
end
