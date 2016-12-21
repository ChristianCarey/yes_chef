User.create(email: "a@a.com",
            password: "password",
            password_confirmation: "password",
            role: "chef")

10.times do
  User.first.menu_items.create(name: Faker::Beer.name,
  description: Faker::Hipster.sentence)
end
