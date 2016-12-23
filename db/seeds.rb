puts "Destroying everything..."
User.destroy_all
Category.destroy_all
Ingredient.destroy_all
OrderItem.destroy_all
Order.destroy_all
MenuItem.destroy_all
Menu.destroy_all
Profile.destroy_all



CATEGORIES = %w(Breakfast Lunch Dinner Vegan Gluten-free Vegetarian Paleo Freegan)

puts "Creating chef..."
User.create(email: "a@a.com",
password: "password",
password_confirmation: "password",
first_name: Faker::Name.first_name,
last_name: Faker::Name.last_name,
role: "chef")

puts "Creating customers..."

User.create(email: "customer@example.com",
password: "password",
password_confirmation: "password",
first_name: Faker::Name.first_name,
last_name: Faker::Name.last_name,
role: "customer",
chef: User.where(role: "chef").sample)
5.times do
  User.create(email: Faker::Internet.email,
  password: "password",
  password_confirmation: "password",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  role: "customer",
  chef: User.where(role: "chef").sample)
end

puts "Creating categories..."
CATEGORIES.each do |category|
  Category.create(name: category)
end

puts "Creating ingredients..."
10.times do
  Ingredient.create(chef: User.where(role: "chef").first,
  name: Faker::Hipster.word)
end

puts "Creating menu items..."
10.times do
  menu_item = User.where(role: "chef").first.menu_items.create(name: Faker::Beer.name,
  description: Faker::Hipster.sentence,
  price_cents: 7_920)

  menu_item.categories << Category.all.sample

  ingredients = Ingredient.all

  4.times do
    ingredient = ingredients.shuffle.pop
    menu_item.ingredients << ingredient unless menu_item.ingredients.include?(ingredient)
  end
end


puts "Creating menus..."
User.where(role: "chef").each do |chef|
  3.times do |n|
    menu = chef.menus.build(order_deadline: Faker::Time.between(Date.today, 5.days.from_now),
                            completion_date: (6 + n).days.from_now)
    menu_items = []

    puts "Creating menu selections and placing orders..."
    rand(3..5).times do
      begin
        menu_item = MenuItem.all.sample.id
      end until !menu_items.include?(menu_item)

      menu_items << menu_item

    end
    menu.menu_item_ids = menu_items
    menu.save!

    10.times do
      Order.create(menu: chef.menus.sample,
      customer: chef.customers.sample)
    end
  end
end

puts "Adding items to orders..."
Order.all.each do |order|
  rand(1..order.menu.menu_items.size).times do
    order.order_items.create(menu_item: order.menu.menu_items.sample,
    quantity: rand(1..3))
  end
end
