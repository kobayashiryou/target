FactoryBot.define do
  factory :company do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    companyname { Faker::Company.name }
  end
end
