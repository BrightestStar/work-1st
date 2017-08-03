class ProvincesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @province = Province.new
  end

  def create
    @province = Province.new(province_params)
    @province.user = current_user

    if @province.save
      redirect_to dictionars_path
    else
      render :new
    end
  end

  def edit
    @province = Province.find(params[:id])
  end

  def update
    @province = Province.find(params[:id])

    if @province.update(province_params)
      redirect_to dictionars_path
    else
      render :edit
    end
  end

  def destroy
    @province = Province.find(params[:id])
    @province.destroy
    redirect_to dictionars_path
  end

  private

  def province_params
    params.require(:province).permit(:name, :city)
  end
end
