FactoryBot.define do
  factory :project do
    title { Faker::Book.title }
    complexity { rand(1..5) }
    user
  end
end
