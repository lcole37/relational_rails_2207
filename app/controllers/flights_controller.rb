class FlightsController < ApplicationController
  def index
    @flights = Flight.order(created_at: :desc)
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
  end

  def create
    Flight.create(flight_params)
    redirect_to '/flights'
  end


  private

  def flight_params
    params.permit(:number,
                :airline,
                :destination,
                :international)
  end
end
