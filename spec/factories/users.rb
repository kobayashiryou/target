FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password(min_length: 6) }
    sequence(:username) {|n| "#{n}_#{Faker::JapaneseMedia::OnePiece.character}" }
    department
  end
end
