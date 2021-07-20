FactoryBot.define do
  factory :department_target do
    monthly_target { "MyString" }
    anually_target { "MyString" }
    department { nil }
  end
end
