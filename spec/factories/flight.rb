FactoryBot.define do
   factory :flight, class: Flight do
      number { Faker::Number.between(from: 100, to: 800) }
      date { Faker::Date.forward(days: [23, 1, 5, 10, 6].sample) }
      departure_city { Faker::Address.city }
      arrival_city { Faker::Address.city }
   end
 end
