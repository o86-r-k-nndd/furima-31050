class OrderAddress

  #Formオブジェクトを定義(バリデーションやメソッドを扱える様にする)
  include ActiveModel::Model

  #OrdersテーブルとAddressesテーブルのカラムを扱える様に属性値を定義
  attr_accessor :user_id,
                :item_id,
                :postal_code,
                :municipalities,
                :address,
                :building_name,
                :phone_number,
                :prefectures_id,
                :order_id

  #OrderモデルとAddressモデルのバリデーションを定義
  with_option presence: true do
    validates :postal_code
  end

end