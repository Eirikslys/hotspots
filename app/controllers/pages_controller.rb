class PagesController < ApplicationController
  def home
  end

  def dashboard
    @locations = current_user.location.all
    @rentals = @locations
  end
end
