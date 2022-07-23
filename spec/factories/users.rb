FactoryBot.define do
  factory :user do
    nick_name {"test"}
    email {Faker::Internet.free_email}
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    family_name {"山田"}
    family_name_kana {"ヤマダ"}
    first_name {"太郎"}
    first_name_kana {"タロウ"}
    birth_day {"2000-01-01"}
  end
end        