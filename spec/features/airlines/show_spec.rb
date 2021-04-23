require 'rails_helper'

RSpec.describe 'airline show page', type: :feature do
  before :each do
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

  it 'has only adult passengers' do
    visit   "/airlines/#{@airline1.id}"

    expect(page).to have_content(@airline1.name)
    expect(page).to have_content(@passenger1.name)
    expect(page).not_to have_content(@passenger2.name)
    expect(page).not_to have_content(@passenger3.name)
    expect(page).to have_content(@passenger4.name)
    expect(page).to have_content(@passenger5.name)
  end
end
