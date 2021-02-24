class TripsController < ApplicationController
  before_action :set_trip, only: %i[show]
  def index
    @trips = current_user.trips.all
    @spaceship_images = [
      "starwars-spaceship-option-1", "starwars-spaceship-option-2", "starwars-spaceship-option-3",
      "starwars-spaceship-option-4"
    ]
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.new
  end

  private

  def trip_params
    params.require(:trip).permit(:origin, :destination,
                                 :launch_date, :price, :spaceship_name, :max_tripulation)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
