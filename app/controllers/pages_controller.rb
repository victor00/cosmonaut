class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trip = Trip.new

    search(params)
  end

  private

  # search tickets from user input
  def search(search_params)
    @search_origin = search_params.dig :search, :origin
    @search_destination = search_params.dig :search, :destination
    @search_launch_date = search_params.dig :search, :launch_date

    if search_params[:sent_search] == "true"
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
