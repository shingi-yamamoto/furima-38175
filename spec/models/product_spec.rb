require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  context '商品出品がうまくいくとき'
    # 1.写真や名前他全ての項目が存在すれば登録できる
    it "is valid with a name, description, category_id, cost_id, status_id, prefecture_id, delivery_days_id, price" do
      expect(@product).to be_valid
    end
  
  context '商品出品がうまくいかないとき'
    # 2.nameが空だと登録できない
    it "is invalid without a name" do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    # 3.descriptionが空だと登録できない
    it "is invalid without a description" do
      @product.description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Description can't be blank"
    end

    # 4.category_idが「---」が選択されている場合は登録できない
    it "is invalid without a category_id" do
      @product.category_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

    # 5.status_idが「---」が選択されている場合は登録できない
    it "is invalid without a status_id" do
      @product.status_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include "Status can't be blank"
    end

    # 6.cost_idが「---」が選択されている場合は登録できない
    it "is invalid without a cost_id" do
      @product.cost_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include "Cost can't be blank"
    end

    # 7.prefecture_idが「---」が選択されている場合は登録できない
    it "is invalid without a prefecture_id" do
      @product.prefecture_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include "Prefecture can't be blank"
    end

    # 8.delivery_days_idが「---」が選択されている場合は登録できない
    it "is invalid without a delivery_days_id" do
      @product.delivery_days_id = '---'
      @product.valid?
      expect(@product.errors.full_messages).to include "Delivery days can't be blank"
    end
    # 9.priceが空だと登録できない
    it "is invalid without a price" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    # 10.imageが空だと登録できない
    it "is invalid without a image" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "Image can't be blank"
    end
    # 11.価格に半角数字以外が含まれている場合は登録できない
    it "is invalid without a price" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    # 12.価格が300円未満では登録できない
    it "is invalid without a image" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    # 13.価格が9_999_999円を超えると登録できない
    it "is invalid without a price" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    # 14.userが紐付いていなければ登録できない
    it "is invalid without a user" do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include "User must exist"
    end
end
