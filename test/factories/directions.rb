FactoryBot.define do
  factory :direction do
    sequence(:number){ |n| n }
    content { '油をひく' }
    association :recipe
  end
end
