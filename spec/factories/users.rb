FactoryGirl.define do
  factory :user, aliases: [:chef] do
    sequence(:email) { |n| "email#{n}@email.com" }
    password 'password'
  end
end
