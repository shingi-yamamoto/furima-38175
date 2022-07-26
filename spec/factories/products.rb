FactoryBot.define do
  factory :product do
    name                  {"ニンジン"}
    description           {"美味しい"}
    category_id           {"1"}
    status_id             {"1"}
    cost_id               {"1"}
    prefecture_id         {"1"}
    delivery_days_id      {"1"}
    price                 {"500"}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end