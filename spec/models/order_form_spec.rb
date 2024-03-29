require 'rails_helper'
RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_form = FactoryBot.build(:order_form, product_id: product.id, user_id: user.id)
end

describe '配送先情報の保存' do
  context '配送先情報の保存ができる時' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_form).to be_valid
    end
    it 'user_idが空でなければ保存できる' do
      @order_form.user_id = 1
      expect(@order_form).to be_valid
    end
    it 'product_idが空でなければ保存できる' do
      @order_form.product_id = 1
      expect(@order_form).to be_valid
    end
    it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
      @order_form.post_code = '123-4567'
      expect(@order_form).to be_valid
    end
    it '市区町村が空でなければ保存できる' do
      @order_form.city = '大田区'
      expect(@order_form).to be_valid
    end
    it '番地が空でなければ保存できる' do
      @order_form.address = '桜台11'
      expect(@order_form).to be_valid
    end
    it '建物名が空でも保存できる' do
      @order_form.building_name = nil
      expect(@order_form).to be_valid
    end
  end

  context '配送先情報が保存できないとき' do
    it 'user_idが空だと保存できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'product_idが空だと保存できない' do
      @order_form.product_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Product can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_form.post_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid", "Post code is the wrong length (should be 8 characters)")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @order_form.post_code = 1_234_567
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid", "Post code is the wrong length (should be 8 characters)")
    end
    it '都道府県が1以上のidが選択されないと保存できないこと' do
      @order_form.prefecture_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it '市区町村が空だと保存できないこと' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると保存できないこと' do
      @order_form.phone_number = '123 - 1234 - 1234'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が12桁以上あると保存できないこと' do
      @order_form.phone_number = 12_345_678_910_123_111
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が9桁以下では保存できないこと' do
      @order_form.phone_number = 12_345
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Phone number is invalid')
    end
    it 'トークンが空だと保存できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
  end
end
end
