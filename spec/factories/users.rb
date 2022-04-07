FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    first_name { 'Octopus' }
    last_name { 'Moktopus' }
    phone { '+7 707 777 0000' }
    birthday { '2022-07-07' }
    role { 'guest' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end