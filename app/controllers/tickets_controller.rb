class TicketsController < ApplicationController
  def index
    @tickets = current_user.tickets.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  #create possibility of pilots buying tickets
  def create
    @trip = Trip.find(params[:trip_id])
    if current_user.pilot && current_user.trips.include?(@trip)
      redirect_to trips_path
      return
    end
   
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.trip = @trip
    if @ticket.save
      redirect_to trips_path
    else
      render "trips/show"
    end
  end

  def ticket_params
    params.require(:ticket).permit(:class_option)
  end
end
