class FlightPassengersController < ApplicationController
  def destroy
    @flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])

    FlightPassenger.find_by(flight: @flight, passenger: passenger).destroy

    redirect_to "/flights"
  end
end
