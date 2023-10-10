require 'rails_helper'

RSpec.describe Delivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @log_delivery = FactoryBot.build(:log_delivery, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '購入できる' do
      it '入力に問題なければ購入できる' do
        expect(@log_delivery).to be_valid
      end
      it '建物名が空でも購入できる' do
        @log_delivery.building_name = ""
        expect(@log_delivery).to be_valid
      end
    end
    context '購入出来ない' do
      it 'tokenが空だと購入出来ない' do
        @log_delivery.token = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空と購入できない' do
        @log_delivery.post_code = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列以外の場合購入できない' do
        @log_delivery.post_code = "1234567"
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '市区町村が空だと購入できない' do
        @log_delivery.municipalities = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと購入できない' do
        @log_delivery.house_number = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @log_delivery.phone_number = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が短いと購入できない' do
        @log_delivery.phone_number = "333"
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が数字以外だと購入できない' do
        @log_delivery.phone_number = "test"
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が12桁以上だと購入できない' do
        @log_delivery.phone_number = "123456789012"
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Phone number is too short")
      end
      it '都道府県が---だと購入できない' do
        @log_delivery.prefecture_id = 1
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'item_idが紐付いてないと購入できない' do
        @log_delivery.item_id = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが紐付いてないと購入できない' do
        @log_delivery.user_id = ""
        @log_delivery.valid?
        expect(@log_delivery.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
