class FlightPassengersController < ApplicationController
  def index
    @flight = Flight.find(params[:id])
    @passengers = @flight.passengers
  end

  def new
    # require "pry"; binding.pry
    @flight = Flight.find(params[:id])
  end

  def create
    # require "pry"; binding.pry
    passenger = Passenger.create(passenger_params)
    redirect_to "/flights/#{passenger.flight_id}/passengers"
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
