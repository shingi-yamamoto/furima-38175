require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '会員情報入力' do
    context '新規登録がうまくいくとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end
      it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角（カタカナ）であれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくかないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailに@がないと登録できない' do
      @user.email = "gggmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailが存在すれば登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "名字が空だと登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it "名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.family_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid. Input full-width characters."
      end  
      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it "フリガナ（名字）が空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it "フリガナ（名前）が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.family_name_kana = "やま"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid. Input full-width katakana characters."
      end
      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "やま"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
      end
      it "生年月日が空だと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end

