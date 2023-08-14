FactoryBot.define do
  factory :item do

        item_name              { "人形" }
        description            { "りかちゃん人形です" }
        category_id             { Faker::Number.between(from: 2, to: 11)} 
        condition_id            { Faker::Number.between(from: 2, to: 7) }
        shipping_fee_id         {  Faker::Number.between(from: 2, to: 3)  }
        prefecture_id           {  Faker::Number.between(from: 2, to: 48)  }
        day_to_ship_id         {  Faker::Number.between(from: 2, to: 4) } 
        price                 { Faker::Number.between(from: 300, to: 999_999) }
        association :user
        after(:build) do |item|
          item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
        end

  end
end