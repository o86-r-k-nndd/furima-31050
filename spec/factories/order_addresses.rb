FactoryBot.define do
  factory :order_address do
  
    postal_code {"123-4567"}
    municipalities {"市区町村"}
    address {"番地"}
    phone_number {"09012345678"}
    item_id {1}
    building_name {"建物名"}

    # 購入処理に使用するトークン
    token {"tok_abcdefghijk00000000000000000"}

    # ActiveHash
    delivery_area_id {Faker::Number.between( from: 2, to: 48 )}

  end
end