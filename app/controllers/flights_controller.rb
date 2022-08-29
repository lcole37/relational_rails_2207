class FlightsController < ApplicationController
  def index
    @flights = Flight.order(created_at: :desc)
  end

  def show
    @flight = Flight.find(params[:id])
  end

  # def passenger_count
  #   Self.passengers.count
  # end
end
