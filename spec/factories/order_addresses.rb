FactoryBot.define do
  factory :order_address do
    postcode          { '123-4567' }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { '東京都' }
    street_address    { '1-1' }
    building          { '東京ハイツ' }
    phone_number      { Faker::Number.number(digits: rand(10..11)) }
    price             {6000}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
