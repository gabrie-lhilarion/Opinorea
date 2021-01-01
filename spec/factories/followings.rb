FactoryBot.define do
  factory :following do
    follower { 1 }
    user { nil }
  end
end
