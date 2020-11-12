require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'Formオブジェクトを用いた複数のモデルへの保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば保存できる' do
    end
    it '郵便番号は必須である' do
    end
    it '郵便番号にはハイフンが必須である' do
    end
    it '郵便番号はハイフンの前に3文字の整数が必須である' do
    end
    it '郵便番号はハイフンの後に4文字の整数が必須である' do
    end
    it '電話番号は必須である' do
    end
    it '電話番号にはハイフン不要である' do
    end
    it '電話番号は11文字以下なら保存できる' do
    end
    it '電話番号は12文字以上では保存できる' do
    end
    it '都道府県は必須である' do
    end
    it '市町村区は必須である' do
    end
    it '番地は必須である' do
    end
    it '建物名は空でも保存できる' do
    end
  end
end