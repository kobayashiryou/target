FactoryBot.define do
  factory :department_target do
    month { Faker::Date.between(from: 1, to: 12) }
    monthly_target { Faker::Lorem.sentence }
    anually_target { Faker::Lorem.sentence }
    department
  end
end
