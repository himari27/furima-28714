require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/images.jpeg')
  end

  describe '出品登録' do
    it '出品画像が選択されていないと出品できない' do
      @item.image = nil
      expect(@item).to be_valid
    end
    it '商品名が入力されていないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が入力されていないと出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーが選択されていないと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が選択されていないと出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '配送料の負担が選択されていないと出品できない' do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it '発送元の地域が選択されていないと出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数が選択されていないと出品できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it '価格が入力されていないと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price 半角数字を使用してください')
    end
    it '価格の範囲が、¥300以上であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be more than 300')
    end
    it '価格の範囲が、¥9,999,999以下であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be lower than 9,999,999')
    end
  end
end
