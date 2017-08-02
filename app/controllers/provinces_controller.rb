class ProvincesController < ApplicationController
  def new
    @province = Province.new
  end

  def create
    @province = Province.new(province_params)

    if @province.save
      redirect_to dictionars_path
    else
      render :new
    end
  end

  private

  def province_params
    params.require(:province).permit(:name, :city)
  end
end
