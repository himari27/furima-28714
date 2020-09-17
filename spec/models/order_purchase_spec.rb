require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    @order_purchase = FactoryBot.build(:order_purchase)
  end

  describe '購入情報登録' do
    it '正しく入力されている場合は購入できる' do
      expect(@order_purchase).to be_valid
    end
    it 'カード番号が入力されてないと購入できない' do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が入力されてないと購入できない' do
      @order_purchase.post_code = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
    end
    it '郵便番号はハイフンが入力されてないと購入できない' do
      @order_purchase.post_code = '6310024'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '都道府県が入力されてないと購入できない' do
      @order_purchase.prefecture_id = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が入力されてないと購入できない' do
      @order_purchase.city = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("City can't be blank")
    end
    it '番地が入力されてないと購入できない' do
      @order_purchase.address = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が入力されてないと購入できない' do
      @order_purchase.phone_number = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid. Without hyphen(-)')
    end
    it '電話番号にはハイフンが入力されていると購入できない' do
      @order_purchase.phone_number = '090-1234121'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Phone number is invalid. Without hyphen(-)')
    end
  end
end
