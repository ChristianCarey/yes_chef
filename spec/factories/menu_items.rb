FactoryGirl.define do
  factory :menu_item do
    name 'Peas'
    description 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, earum, tempore. Similique nihil quae qui optio quas nulla at nobis. Tempore nam totam eius eaque?'
    association :chef, factory: :user
  end
end
