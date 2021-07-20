FactoryBot.define do
  factory :todo_target do
    body { Faker::Lorem.sentence }
    department
  end
end
