FactoryBot.define do
  factory :agsk do
    sequence(:requirement) { |n| "MyString#{n}" }
    concept { "MyString" }
    descriptor { "MyString" }
    filter { 1 }
    user { nil }

    trait :invalid do
      requirement { nil }
    end
  end
end
