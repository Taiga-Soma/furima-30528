require 'rails_helper'

RSpec.describe OrderDonation, type: :model do
  before do
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @buyer = FactoryBot.create(:user)
    @order = FactoryBot.build(:OrderDonation, user_id: @buyer.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it ' post_idとprefecture_idとcityとaddressとtelとtokenがあれば保存できる' do
        expect(@order).to be_valid
      end

      it 'buildingnameが空でも保存できる' do
        @order.buildingname = nil
        expect(@order).to be_valid
      end
    end

    context '購入機能がうまくいかないとき' do
      it 'post_idが空のときは購入できない' do
        @order.post_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post can't be blank")
      end

      it 'post_idはハイフンがないと購入できない' do
        @order.post_id = 1_111_111
        @order.valid?
        expect(@order.errors.full_messages).to include('Post is invalid')
      end

      it 'prefecture_idが空のときは購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'id=1を選択したときは購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空のときは購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空のときは購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空のときは購入できない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが11桁以上だと購入できない' do
        @order.tel = 123_456_789_000
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end

      it 'tokenが空のときは購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
