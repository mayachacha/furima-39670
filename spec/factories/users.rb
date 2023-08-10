FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.email}
    password              {"abcd1234"}
    password_confirmation {password}
    last_name             { "田中" }
    first_name            { "太郎" }
    last_name_kana        { "タナカ" } 
    first_name_kana       { "タロウ" }
    birthday              { Faker::Date.between(from: '1980-01-01', to: '2000-12-31') }
end
end
