#Item model testcode
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#new' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end

    it "全ての情報が正しく入力されていれば保存できる" do
      expect(@item).to be_valid
    end

    ## 商品情報/ActiveStorage
    it "画像が必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    ## //商品情報/ActiveStorage
  
    ## 商品情報/商品名
    it "商品名が必須である" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    ## //商品情報/商品名

    ## 商品情報/ActiveHash
    it "カテゴリーの入力が必須である" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "category_idが1(---)の時保存できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態の入力が必須である" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "status_idが1(---)の時保存できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "配送料の入力が必須である" do
      @item.shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end

    it "shipping_idが1(---)の時保存できない" do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
    end

    it "発送元の地域の入力が必須である" do
      @item.delivery_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end

    it "delivery_area_idが1(---)の時保存できない" do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it "発送までの日数の入力が必須である" do
      @item.delivery_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank")
    end

    it "delivery_days_idが1(---)の時保存できない" do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
    end
    ## //商品情報/ActiveHash

    ## 商品情報/価格
    it "価格の入力が必須である" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格は300~9999999の間である必要がある" do
      #300未満
      @item.price = 123
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      #9999999より大きい
      @item.price = 1234567890
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "価格は数値での入力が必須である" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    ## //商品情報/価格

  end
end