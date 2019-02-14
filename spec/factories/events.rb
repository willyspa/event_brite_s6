FactoryBot.define do
  factory :event do
    association :admin_event, factory: :user
    association :attendances_id, factory: :user
    start_date { Faker::Date.forward(5) }
    duration { 5 }
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph(2) }
    price { Faker::Number.between(1, 1000) }
    location { "Fresnes" }
  end
end
