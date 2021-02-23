class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  
  def home
    @trip = Trip.new
    @search_origin = params.dig :search, :origin
    @search_destination = params.dig :search, :destination
    @search_launch_date = params.dig :search, :launch_date
    @trips = Trip.where("origin = :origin and destination = :destination and launch_date = :launch_date", 
                        { origin: @search_origin, destination: @search_destination, launch_date: @search_launch_date})
  end
end
