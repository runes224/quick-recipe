FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "tester#{n}@example.com"}
    name {"Example"}
    password {"password"}
    password_confirmation {"password"}
  end
end