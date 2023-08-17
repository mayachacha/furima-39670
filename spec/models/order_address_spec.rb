require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '支払い情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

  context '購入できる場合' do
    it "必要情報があれば保存ができること" do
      expect(@order_address).to be_valid
    end

    it 'buildingは空でも保存できること' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end
  
  context '内容に問題がある場合' do
    it "郵便番号が必須であること" do
      @order_address.postcode = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
    end
  
    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      @order_address.postcode = '123'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
  
    it '都道府県が1では登録できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村が必須であること" do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
  
    it "番地が必須であること" do
     @order_address.street_address = ''
     @order_address.valid?
     expect(@order_address.errors.full_messages).to include("Street address can't be blank")
    end

  
    it "電話番号が必須であること" do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
  
    it "電話番号は、10桁未満では保存できないこと" do
      @order_address.phone_number = 111
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it "電話番号は、12桁以上では保存できないこと" do
      @order_address.phone_number = 123456789000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it "電話番号は、半角数値のみ保存可能なこと" do
      @order_address.phone_number = 'abcdefghij'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is not a number")
    end

    it "電話番号は、全角では保存できないこと" do
      @order_address.phone_number = '１２３４５６７８９０'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is not a number")
    end

    it 'tokenが空では保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'userが紐付いていないと保存できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
end