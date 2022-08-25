class FlightPassengersController < ApplicationController
  def index
    @flight = Flight.find(params[:id])
    @passengers = @flight.passengers
  end
end
