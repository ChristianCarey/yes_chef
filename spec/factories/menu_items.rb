FactoryGirl.define do
  factory :menu_item do
    sequence(:name) { |n| "item \##{n}" }
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, earum, tempore. Similique nihil quae qui optio quas nulla at nobis. Tempore nam totam eius eaque?'
    association :chef, :chef, factory: :user
  end
end
