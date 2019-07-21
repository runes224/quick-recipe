FactoryBot.define do
  factory :recipe do
    name { "オムライス" }
    description { "かなり美味しい" }
    association :user
  end
end
