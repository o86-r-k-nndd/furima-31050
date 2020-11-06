FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {Faker::Date.backward}
  
    # 全角入力の設定
    first_name {"山田"}
    last_name {"太郎"}
  
    #全角入力（かな）の設定
    first_name_kana {"ヤマダ"}
    last_name_kana {"タロウ"}
  end
end