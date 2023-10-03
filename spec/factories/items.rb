FactoryBot.define do
  factory :item do
    name {Faker::Name::name}
    info {Faker::Lorem.sentence}
    category_id { 2 }
    condition_id { 2 }
    burden_info_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { rand(300..9999999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
