FactoryGirl.define do
  factory :menu do
    order_deadline Date.today
    completion_date   Date.tomorrow
  end
end
