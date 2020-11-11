class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Association model
  has_many :items
  has_many :orders

  #バリデーションの設定 not null
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  #バリデーションの設定 氏名の入力の際 全角（漢字、ひらがな、カタカナ）入力の制約をかける
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end

  #バリデーションの設定 氏名のフリガナ入力の際 カタカナでの入力の制約をかける
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end

  #バリデーションpasswordの文字列の入力時に英数字混合かどうかの制約をかける
  validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

end
