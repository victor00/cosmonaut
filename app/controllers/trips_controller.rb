class TripsController < ApplicationController
  before_action :set_trip, only: %i[show]
  def index
    if current_user.pilot
      @trips = current_user.trips.all
    else
      @tickets = current_user.tickets.all
    end
    @spaceship_images = spaceship_images
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
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:origin, :destination,
                                 :launch_date, :price, :spaceship_name, :max_tripulation)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def spaceship_images
    [
      "spaceship1", "spaceship2", "spaceship3",
      "spaceship4", "spaceship5", "spaceship6",
      "spaceship7"
    ]
  end
end
