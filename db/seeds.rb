5.times do
  user = User.create(email: Faker::Internet.email,
      password: Faker::Config.random.seed)

  project = Project.create(title: Faker::Books::Dune.quote,
    complexity: Faker::Number.between(from: 1, to: 5),
    user_id: 1)

  task = Task.create(
    title: Faker::Fantasy::Tolkien.character,
    description: Faker::Fantasy::Tolkien.poem,
    deadline_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user_id: 1,
    project_id: 1)

end
