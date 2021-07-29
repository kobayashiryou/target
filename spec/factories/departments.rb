FactoryBot.define do
  factory :department do
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password(min_length: 6) }
    sequence(:departmentname) {|n| "#{n}_#{Faker::Company.industry}" }
    company
  end
end
