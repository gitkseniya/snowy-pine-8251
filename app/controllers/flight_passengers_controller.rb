class FlightPassengersController < ApplicationController
  def destroy

    @passenger = Passenger.find(params[:passenger_id])
    @flight = Flight.find(params[:flight_id])

    FlightPassenger.delete(passenger: @passenger, flight: @flight)

    redirect_to "/flights"
  end
end
