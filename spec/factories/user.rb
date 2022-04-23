FactoryBot.define do
  factory :user do
    name { "testuser1" }
    email { "example@example.com" }
    password { "password" }
  end
end