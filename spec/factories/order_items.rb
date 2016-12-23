FactoryGirl.define do
  factory :order_items do
    menu_item nil
    order nil
    quantity 1
    sale_price 1.5
  end
end
