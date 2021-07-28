FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    username{ Faker::JapaneseMedia::OnePiece.character }
    department
  end
end
