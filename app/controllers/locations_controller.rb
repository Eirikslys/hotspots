class LocationsController < ApplicationController
  def index
    @locations = Locations.all
  end
end
