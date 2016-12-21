FactoryGirl.define do
  factory :menu do
    start_date Date.today
    end_date   Date.tomorrow
  end
end
