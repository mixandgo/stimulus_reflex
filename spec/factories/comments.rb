FactoryBot.define do
  factory :comment do
    body { "MyString" }
    user { nil }
    post { nil }
  end
end
