FactoryBot.define do
  factory :following do
    follower_id { Faker.follower_id }
    user_id { Faker.user_id }
  end
end
