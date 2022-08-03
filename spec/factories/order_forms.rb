FactoryBot.define do
  factory :order_form do
    post_code      {'123-4567'}
    prefecture_id  {'3'}
    city           {'大田区'}
    address        {'1-1-1'}
    building_name  {'建築ビル'}
    phone_number   {'09044444444'}
    token          {'22222'}
  end
end
