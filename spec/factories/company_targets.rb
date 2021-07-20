FactoryBot.define do
  factory :company_target do
    monthly_target { "MyString" }
    anually_target { "MyString" }
    company { nil }
  end
end
