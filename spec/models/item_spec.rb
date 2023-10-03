require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる' do
      it '入力が問題なければ出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品出来ない' do
      it '画像が空だと出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空と出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが空だと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空だと出品できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料負担が空だと出品できない' do
        @item.burden_info_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden info can't be blank")
      end
      it '発送元が空だと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送日数が空だと出品できない' do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300以下だったら出品できない' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が1千万円以上だったら出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が半角以外の場合出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'カテゴリーの選択肢が---だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の選択肢が---だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料負担の選択肢が---だと出品できない' do
        @item.burden_info_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden info can't be blank")
      end
      it '発送元の選択肢が---だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送日数の選択肢が---だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'ユーザーが紐付いていないと出品出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
