class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show]

  def index
    @attractions = Attraction.all
  end

  def ride
    ride = Ride.new
    ride.user = User.find(session[:user_id])
    ride.attraction = Attraction.find(params[:id])
    ride.save
    msg = ride.take_ride
    redirect_to user_path(ride.user), notice: msg
  end

  private
  def set_attraction
    @attraction = Attraction.find(params[:id])    
  end

end
