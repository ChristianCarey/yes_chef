puts "Destroying everything..."
User.destroy_all

puts "Creating user..."
User.create(email: "a@a.com",
            password: "password",
            password_confirmation: "password",
            role: "chef")

puts "Creating menu items..."
10.times do
  User.first.menu_items.create(name: Faker::Beer.name,
  description: Faker::Hipster.sentence,
  price_cents: 7_920)
end

puts "Creating menus..."
3.times do
  User.first.menus.create(order_deadline: Faker::Time.between(2.days.ago, Date.today),
                          completion_date:   Faker::Time.forward(5))
end

puts "Creating menu selections..."
Menu.all.each do |menu|
  rand(3..5).times do
    begin
      menu_item = MenuItem.all.sample
    end until !menu.menu_items.include?(menu_item)

    menu.menu_items << menu_item
  end
end
