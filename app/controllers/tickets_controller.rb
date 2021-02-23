class TicketsController < ApplicationController
  
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.trip = @trip
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render "trips/show"
    end
  end

  def ticket_params
    params.require(:ticket).permit(:class_option)
  end
end