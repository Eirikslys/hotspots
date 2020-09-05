class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @locations = Location.geocoded

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to locations_path(@location)
    else
      render :new
    end

  end

  private

  def location_params

    params.require(:location).permit(:name, :address, :description, :price, :photo)

  end
end
