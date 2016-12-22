FactoryGirl.define do
  factory :user, aliases: [:chef] do
    sequence(:email) { |n| "email#{n}@email.com" }
    password 'password'

    trait :chef do
      role 'chef'
    end

    trait :customer do
      role 'customer'
    end
  end

end
