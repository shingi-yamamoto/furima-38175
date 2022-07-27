class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank" }
  validates :image,               presence: true
  validates :name,                presence: true
  validates :description,         presence: true
  validates :cost_id,             presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :status_id,           presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :prefecture_id,       presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :delivery_days_id,    presence: true, numericality: { other_than: 0 , message: "can't be blank" }
  validates :price,               presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }


  # テーブルとのアソシエーション
  belongs_to :user
  #has_one :item_purchase

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :cost
  belongs_to :delivery_days

  # active_storageとのアソシエーショ
  has_one_attached :image
end
