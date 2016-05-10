class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit]

  def index
    @attractions = Attraction.all
    @is_admin = is_admin
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)    
  end

  def create
    @attraction = Attraction.find_or_create_by(attraction_params)
    redirect_to attraction_path(@attraction)
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
    @is_admin = is_admin    
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
  end

end
