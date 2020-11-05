FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example"}
    password { "password" }

    trait :admin do
      admin { true }
    end
  end
end