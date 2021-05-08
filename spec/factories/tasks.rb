FactoryBot.define do
  factory :task do
    title { Faker::Book.title }
    description { Faker::Book.title }
    deadline_date { Faker::Date.forward(days: 5) }
    user
    project
  end
end
