FactoryBot.define do
  factory :purpose do
    title { Faker::Internet.email }
    # term {  }
    time { "1" }
  end
end
