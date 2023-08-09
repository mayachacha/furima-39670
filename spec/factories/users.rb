FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { Faker::Name.kana } 
    first_name_kana       { Faker::Name.kana }
    birthday              { Faker::Date.between(from: '1980-01-01', to: '2000-12-31') }
end
end
