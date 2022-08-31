class FlightPassengersController < ApplicationController
  def index
    @flight = Flight.find(params[:id])
    @passengers = @flight.passengers
  end

  def new
    @flight = Flight.find(params[:flight_id])
  end

  def create
    passenger = Passenger.create(passenger_params)
    redirect_to "/flights/#{passenger.flight_id}/passengers"
    # require "pry"; binding.pry
  end

  private

  def flight_params
    params.permit(:number,
                  :airline,
                  :destination,
                  :international)
  end

  def passenger_params
    params.permit(:name,
                  :age,
                  :gold_status,
                  :flight_id)

  end
end
