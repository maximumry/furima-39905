# log_deliveries.rb
FactoryBot.define do
  factory :log_delivery do
    post_code { "111-1111" }
    prefecture_id { 2 }
    municipalities { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    phone_number { "09099999999" }
    token { Faker::Alphanumeric.alphanumeric(number: 20) } 
  end
end
