FactoryBot.define do
   factory :passenger, class: Passenger do
      name { Faker::Name.name_with_middle }
      age { Faker::Number.between(from: 2, to: 80) }
   end
 end
