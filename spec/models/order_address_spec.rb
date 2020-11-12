require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'Formオブジェクトを用いた複数のモデルへの保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end

    it '郵便番号は必須である' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にはハイフンが必須である' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号はハイフンの前に3文字の整数が必須である' do
      @order_address.postal_code = "-1234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号はハイフンの後に4文字の整数が必須である' do
      @order_address.postal_code = "123-"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '電話番号は必須である' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にはハイフン不要である' do
      @order_address.phone_number = "090-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は11文字以下なら保存できる' do
      @order_address.phone_number = "0123456789"
      expect(@order_address).to be_valid
    end

    it '電話番号は12文字以上では保存できない' do
      @order_address.phone_number = "0123456789012"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '都道府県は必須である' do
      @order_address.delivery_area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Delivery area can't be blank")
    end

    it '都道府県のidは１では保存できない' do
      @order_address.delivery_area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it '市町村区は必須である' do
      @order_address.municipalities = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '番地は必須である' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '建物名は空でも保存できる' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end

    it '購入した商品のID情報を保存するitem_idの値は必須である' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

  end
end