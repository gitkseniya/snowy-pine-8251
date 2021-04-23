require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many(:flights) }
    it { should have_many(:flight_passengers).through(:flights) }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  before(:each) do
    @airline1 = create(:airline)

    @flight1 = create(:flight, airline: @airline1)
    @flight2 = create(:flight, airline: @airline1)
    @flight3 = create(:flight, airline: @airline1)

    @passenger1 = create(:passenger, age: 40)
    @passenger2 = create(:passenger, age: 8)
    @passenger3 = create(:passenger, age: 15)
    @passenger4 = create(:passenger, age: 18)
    @passenger5 = create(:passenger, age: 60)

    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger5)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger5)
  end

  describe 'methods' do
    it 'lists adult and unique passengers' do
      expect(@airline1.adult_passengers.count).to eq(3)
    end

  end
end
