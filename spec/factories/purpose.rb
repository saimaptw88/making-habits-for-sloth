FactoryBot.define do
  factory :purpose do
    title { Faker::Internet.email }
    term { 66 }
    time { 1 }
  end
end
