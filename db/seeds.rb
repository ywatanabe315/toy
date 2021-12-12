50.times do |n|
  User.create(name: Faker::Name.name, email: "example-#{n}@hoge.com")
end
