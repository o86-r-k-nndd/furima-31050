class OrderAddress

  # Formオブジェクトを定義(バリデーションやメソッドを扱える様にする)
  include ActiveModel::Model

  # OrdersテーブルとAddressesテーブルのカラムを扱える様に属性値を定義
  attr_accessor :postal_code,
                :municipalities,
                :address,
                :building_name,
                :phone_number,
                :delivery_area_id,
                :user_id,
                :item_id

  # OrderモデルとAddressモデルのバリデーションを定義
  with_option presence: true do
    validates :municipalities
    validates :address
    # orderモデルの属性
    validates :user_id
    validates :item_id

    # ActivdHash "---"の時は保存できない
    validates :delivery_area_id  numericality: { other_than: 1 }

    # 郵便番号はハイフンを含んだ数値
    validates :postal_code,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }

    # 電話番号は11桁以内の値
    validates :phone_number,    format: { with: /\A[0-9]{,11}\z/ }
    
  end

  # 複数のテーブルへ保存する処理
  def save
    binding.pry # 後でparamsの値を確認 item_idの情報なども確認
    # 購入者情報をOrdersテーブルへ保存
    order = Order.create(user_id: user_id, item_id: item_id )
    binding.pry # 正常に値が取得できているか確認
    # 購入者の住所情報をAddressesテーブルへ保存
    Address.create( postal_code:      postal_code,
                    municipalities:   municipalities,
                    address:          address,
                    building_name:    building_name,
                    phone_number:     phone_number,
                    delivery_area_id: delivery_area_id,
                    order_id:         order.id)
  end
  # //複数のテーブルへ保存する処理

end