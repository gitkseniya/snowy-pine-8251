require 'rails_helper'

RSpec.describe 'flights index page', type: :feature do
  before :each do
    @airline1 = create(:airline)
    @airline2 = create(:airline)

    @flight1 = create(:flight, airline: @airline1)
    @flight2 = create(:flight, airline: @airline1)
    @flight3 = create(:flight, airline: @airline2)

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
    FlightPassenger.create!(flight: @flight3, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger5)
  end

  it 'flight index page has each flight listed with its attributes' do
    visit "/flights"

    expect(page).to have_content('Flights')

    within "#flight-#{@flight1.id}" do
      expect(page).to have_content(@flight1.number)

      expect(page).to have_content(@flight1.airline.name)

      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
    end

    within "#flight-#{@flight3.id}" do
      expect(page).to have_content(@flight3.number)

      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
      expect(page).to have_content(@passenger5.name)

      expect(page).to have_content(@flight3.airline.name)
    end
  end

  it 'shows Remove button that upon click removes a passenger from the flight' do
    visit "/flights"

    within "#flight-#{@flight1.id}" do
      within "#passenger-#{@passenger1.id}" do
        # save_and_open_page
        click_on "Remove"

        expect(current_path).to eq("/flights")
        expect(page).to_not have_content(@passenger1.name)

      end
    end
  end
end
