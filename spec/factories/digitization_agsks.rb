FactoryBot.define do
  factory :digitization_agsk do
    requirement { "MyText" }
    concept { "MyString" }
    descriptor { "MyString" }
    formalizability { 1 }
    user { nil }
  end
end
