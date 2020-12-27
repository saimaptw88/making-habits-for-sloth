FactoryBot.define do
  factory :task do
    title { Faker::Internet.email }

    user
    purpose
  end
end
