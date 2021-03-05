FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { "secreT123" }
    username { "mixandgo" }
  end
end
