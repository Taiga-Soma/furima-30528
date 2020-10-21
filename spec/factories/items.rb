FactoryBot.define do
  factory :item do
    title                 {"test"}
    price                 {888}
    description           {"test"}
    category_id           {2}
    status_id             {2}
    burden_id             {2}
    prefecture_id         {2}
    daystoship_id         {2}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
