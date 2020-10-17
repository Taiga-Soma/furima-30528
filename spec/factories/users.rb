FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    firstname             {Gimei.first.kanji}
    lastname              {Gimei.last.kanji}
    first_name_kana       {Gimei.first.katakana}
    last_name_kana        {Gimei.last.katakana}
    birthday              {Faker::Date.in_date_period}
  end
end