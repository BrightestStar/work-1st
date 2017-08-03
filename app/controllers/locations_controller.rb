class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user

    if @location.save
      redirect_to dictionars_path
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to dictionars_path
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to dictionars_path

  end

  private

  def location_params
    params.require(:location).permit(:name, :url01, :url02)
  end
end
