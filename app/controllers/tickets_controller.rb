class TicketsController < ApplicationController
  def index
    @tickets = current_user.tickets
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    return if current_user.pilot && current_user.trips.include?(@trip)

    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.trip = @trip

    if @ticket.save && current_user.pilot
      redirect_to broughts_path(play_song: true)
      return
    end

    if @ticket.save && !current_user.pilot
      redirect_to trips_path(play_song: true)
    else
      render "trips/show"
    end
  end

  def ticket_params
    params.require(:ticket).permit(:class_option)
  end
end
