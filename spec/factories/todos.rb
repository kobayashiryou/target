FactoryBot.define do
  factory :todo do
    body { Faker::Lorem.sentence }
    user
    todo_target
  end
end
