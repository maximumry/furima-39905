require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it 'nickname, email, passwordとpassword_comfirm, last_nameとfirst_name, kana_lastとkana_first, birth_dayが存在していればサインアップできる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ない' do
      it 'nicknameがからでは登録出来ない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録出来ない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailには@が含まれていない登録出来ない' do
        @user.email = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在しては登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録出来ない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録出来ない' do
        @user.password = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが129文字以上では登録出来ない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが英字か数字どちらかしか存在しない場合は登録出来ない' do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していないと登録出来ない' do
        @user.password = '1234'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録出来ない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが漢字、ひらがな、カタカナ以外の場合は登録出来ない' do
        @user.last_name = "last"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'first_nameが空では登録出来ない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが漢字、カタカナ、ひらがな以外の場合は登録出来ない' do
        @user.first_name = "first"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'kana_lastが空では登録出来ない' do
        @user.kana_last = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")
      end
      it 'kana_lastが全角カタカナ以外では登録出来ない' do
        @user.kana_last = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid. Input full-width katakana characters") 
      end
      it 'kana_firstが空では登録出来ない' do
        @user.kana_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'kana_firstが全角カタカナ以外では登録出来ない' do
        @user.kana_first = "かきくけこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid. Input full-width katakana characters") 
      end
      it 'birth_dayが空では登録出来ない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
