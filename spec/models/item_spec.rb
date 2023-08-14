require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '新規出品' do
    context '出品できるとき' do
      it '必要項目がすべて入力されている' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない時' do
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")        
      end
            
        it '送料が1では登録できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end

        it '発送元が空では登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '発送までの日数が1では登録できない' do
          @item.day_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day to ship can't be blank")
        end
        
        it '価格が空では登録できない' do
          @item.price = ''
          @item.valid?
         expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '画像が空では登録できない' do
          @item.image = nil
          @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
        end

          it '価格は、300未満では保存できない' do
            @item.price = 299
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
          end

          it '価格が10,000,000以上だと保存できない' do
            @item.price = 10_000_000
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
          end

          it '価格は全角文字は登録できない' do
            @item.price = '５０００'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is not a number')
          end

  
    end
  end
end