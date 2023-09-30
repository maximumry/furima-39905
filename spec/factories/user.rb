FactoryBot.define do
  require 'faker/japanese'
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6) + "ACD"}
    password_confirmation {password}
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    kana_last             {Faker::Japanese::Name.last_name.yomi}
    kana_first            {Faker::Japanese::Name.first_name.yomi}
    birth_day             {Faker::Date.birthday}
  end
end