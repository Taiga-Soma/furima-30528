FactoryBot.define do
  factory :OrderDonation do
    post_id           { 1_234_567.to_s.insert(3, '-') }
    prefecture_id     { 2 }
    city              { Gimei.city.kanji }
    address           { Gimei.town.to_s }
    tel               { Faker::Number.number(digits: 11) }
    token             { Faker::Internet.password }
  end
end
