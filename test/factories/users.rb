FactoryBot.define do
  factory :user, aliases: [:owner] do
    name {'Aaron'}
    email {'tester@example.com'}
    password {'password'}
  end
end
