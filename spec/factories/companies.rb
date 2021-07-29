FactoryBot.define do
  factory :company do
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password(min_length: 6) }
    sequence(:companyname) {|n| "#{n}_#{Faker::Company.name}" }
  end
end
