class OrderAddress

  # Formオブジェクトを定義(バリデーションやメソッドを扱える様にする)
  include ActiveModel::Model

  # OrdersテーブルとAddressesテーブルのカラムを扱える様に属性値を定義
  attr_accessor :postal_code,
                :municipalities,
                :address,
                :building_name,
                :phone_number,
                :prefectures_id

  # OrderモデルとAddressモデルのバリデーションを定義
  with_option presence: true do
    validates :delivery_area_id
    validates :municipalities
    validates :address
    # 郵便番号はハイフンを含んだ数値
    validates :postal_code,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    # 電話番号は11桁以内の整数の値
    validates :phone_number,    numericality: { only_integer:           true,
                                                less_than_or_equal_to:  11 }
  end

end