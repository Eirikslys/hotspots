class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to locations_path(@location)
  end

  private

  def location_params
    params.require(:location).permit(:name, :adress, :description, :price)
  end
end
