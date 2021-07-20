FactoryBot.define do
  factory :department_target do
    monthly_target { Faker::Lorem.sentence }
    anually_target { Faker::Lorem.sentence }
    department
  end
end
