require 'rails_helper'

RSpec.describe OrderPay, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_pay = FactoryBot.build(:order_pay, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  describe '商品購入情報の保存' do
    context '商品購入情報を保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_pay).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_pay.building = ''
        expect(@order_pay).to be_valid
      end
    end

    context '商品購入情報を保存できないとき' do
      it 'postal_codeが空では保存できない' do
        @order_pay.postal_code = ''
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @order_pay.prefecture_id = ''
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_pay.city = ''
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_pay.address = ''
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_pay.phone_number = ''
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @order_pay.postal_code = '1234567'
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeは半角英数混合では保存できない' do
        @order_pay.postal_code = '123-abcd'
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Postal code is invalid")
      end    
      it 'postal_codeは全角では保存できない' do
        @order_pay.postal_code = '１２３-４５６７'
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idは選択していないと保存できない' do
        @order_pay.prefecture_id = 1
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'phone_numberは12桁の数字では保存できない' do
        @order_pay.phone_number = '090123456789'
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは半角英数混合では保存できない' do
        @order_pay.phone_number = 'abc123456789'
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは全角では保存できない' do
        @order_pay.phone_number = '０９０１２３４５６７８'
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_id（購入者）が空だと保存できない' do
        @order_pay.user_id = ' '
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと保存できない' do
        @order_pay.item_id = ' '
        @order_pay.valid?
        expect(@order_pay.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end