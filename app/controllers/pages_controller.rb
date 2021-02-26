class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trip = Trip.new
    @search_origin = params.dig :search, :origin
    @search_destination = params.dig :search, :destination
    @search_launch_date = params.dig :search, :launch_date

    if params[:sent_search] == "true"
      @trips = Trip.all
      @trips = @trips.where(origin: @search_origin) if @search_origin.present?
      @trips = @trips.where(destination: @search_destination) if @search_destination.present?
      @trips = @trips.where(launch_date: @search_launch_date) if @search_launch_date.present?
      @trips = @trips.select { |trip| (trip.max_tripulation - trip.tickets.count).positive? }
    else
      @trips = []
    end
  end
end
