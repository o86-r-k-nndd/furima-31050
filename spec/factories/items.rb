FactoryBot.define do
  factory :item do
    name {Faker::Name.last_name}
    price {Faker::Number.between( from: 300, to: 9999999 )}
    explanation {"abc123あいうアイウ一二三"}
    
    #ActiveHash
    category_id {2}
    status_id {2}
    shipping_id {2}
    delivery_area_id {2}
    delivery_days_id {2}

    #ActiveStorage
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end

    #Association model
    association :user
  end
end
