class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @location = Location.find(params[:location_id])

  end

  def create
    @location = Location.find(params[:location_id])
    @rental = Rental.new(rental_params)
    @rental.location = @location
    @rental.user = current_user
    if @rental.save
      redirect_to locations_path, alert: "Your booking was succesful!  🎉 🎉 🎉"

    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:location, :user, :start_date, :end_date)
  end
end

