#Userモデル単体テストコード
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての情報が正しく入力されていれば登録できる" do
      expect(@user).to be_valid
    end

    ## 登録情報/ユーザー情報
    it "nicknameが空の時登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空の時登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailは一意性である事" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailには@が必須である事" do
      @user.email = "123456abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが必須である事" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上が必須である事" do
      @user.password = "a1234"
      @user.password_confirmation = "a1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passworfは半角英数字混合での入力が必須である事" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "確認用のpassword_confirmationの入力が必須である事" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confirmationの値が一致しなければ保存できない" do
      @user.password = "123abc"
      @user.password_confirmation = "abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    ## //登録情報/ユーザー情報

    ## 登録情報/本人情報確認
    it "名字の入力が必須である" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名前の入力が必須である" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "名字は全角(漢字、ひらがな、カタカナ)での入力が必須である事" do
      @user.first_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "名前は全角(漢字、ひらがな、カタカナ)での入力が必須である" do
      @user.last_name = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "名字のフリガナは必須である" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "名前のフリガナは必須である" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "名字のフリガナはカタカナで入力する必要がある" do
      @user.first_name_kana = "あいう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "名前のフリガナはカタカナで入力する必要がある" do
      @user.last_name_kana = "あいう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "生年月日の入力が必須である" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    ## //登録情報/本人情報確認
  end
end
