class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @locations = current_user.location.all
    @rentals = @locations
  end
end
