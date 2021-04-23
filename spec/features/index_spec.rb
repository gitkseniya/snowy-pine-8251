require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
  before :each do
    @airline = create(:airline)

    @flight1 = create(:flight, airline: @airline)
    @flight2 = create(:flight, airline: @airline)
    @flight3 = create(:flight, airline: @airline)

    @passenger1 = create(:passenger)
    @passenger2 = create(:passenger)
    @passenger3 = create(:passenger)
    @passenger4 = create(:passenger)
    @passenger5 = create(:passenger)

    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger5)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
  end

  it 'flight index page has each flight listed with its attributes' do
    visit "/flights"

    expect(page).to have_content('Flights')
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)

    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger2.name)

    expect(page).to have_content(@flight1.airline.name)
  end
end
