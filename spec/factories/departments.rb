FactoryBot.define do
  factory :department do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    departmentname { Faker::Company.industry }
    company
  end
end
