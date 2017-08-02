class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to dictionars_path
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :url01, :url02)
  end
end
