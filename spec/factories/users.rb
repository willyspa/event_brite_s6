FactoryBot.define do
  factory :user do
    email { "MyString" }
    password { "MyString" }
    password_confirmation { "MyString" }
    description { "MyText" }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
