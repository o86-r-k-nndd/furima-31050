FactoryBot.define do
  factory :item do
    name {Faker::Name.last_name}
    price {Faker::Number.between( from: 300, to: 9999999 )}
    
    #ActiveHash
    category_id {Faker::Number.between( from: 2, to: 11 )}
    status_id {Faker::Number.between( from: 2, to: 7 )}
    shipping_id {Faker::Number.between( from: 2, to: 3 )}
    delibery_area_id {Faker::Number.between( from: 2, to: 48 )}
    delibery_days_id {Faker::Number.between( from: 2, to: 4 )}

    #ActiveStorage
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
    
  end
end
