puts "Destroying everything..."
User.destroy_all

puts "Creating chef..."
User.create(email: "a@a.com",
            password: "password",
            password_confirmation: "password",
            role: "chef")

puts "Creating customers..."

User.create(email: "customer@example.com",
            password: "password",
            password_confirmation: "password",
            role: "customer",
            chef: User.where(role: "chef").sample)
5.times do
  User.create(email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password",
              role: "customer",
              chef: User.where(role: "chef").sample)
end

puts "Creating menu items..."
10.times do
  User.first.menu_items.create(name: Faker::Beer.name,
  description: Faker::Hipster.sentence,
  price_cents: 7_920)
end

puts "Creating menus..."

User.where(role: "chef").each do |chef|
  3.times do |n|
    chef.menus.create(order_deadline: Faker::Time.between(Date.today, 5.days.from_now),
                      completion_date: (6 + n).days.from_now)
  end
end

puts "Creating menu selections and placing orders..."
Menu.all.each do |menu|
  rand(3..5).times do
    begin
      menu_item = MenuItem.all.sample
    end until !menu.menu_items.include?(menu_item)

    menu.menu_items << menu_item
  end

  10.times do
    chef = User.where(role: "chef").sample
    Order.create(menu: chef.menus.sample,
                 customer: chef.customers.sample)
  end
end

puts "Adding items to orders..."
Order.all.each do |order|
  rand(1..order.menu.menu_items.size).times do
    order.order_items.create(menu_item: order.menu.menu_items.sample,
                                  quantity: rand(1..3))
  end
end
