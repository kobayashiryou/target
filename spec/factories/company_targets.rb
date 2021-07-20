FactoryBot.define do
  factory :company_target do
    monthly_target { Faker::Lorem.sentence }
    anually_target { Faker::Lorem.sentence }
    company
  end
end
