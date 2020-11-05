FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example"}
    password { "password" }
  end
end