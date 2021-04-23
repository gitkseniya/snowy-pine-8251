FactoryBot.define do
   factory :airline, class: Airline do
      name { Faker::Movies::Departed.character }
   end
 end
