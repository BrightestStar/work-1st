class InformationController < ApplicationController
  def index
    @information = Information.all
  end

  def new
    @information = Information.new
    @locations = Location.all.map { |l| [l.name, l.id] }
    @provinces = Province.all.map { |province| [province.name, province.id] }
  end

  def create
    @information = Information.new(information_params)
    @information.location_id = params[:location_id]
    @information.province_id = params[:province_id]

    if @information.save
      redirect_to information_index_path
    else
      render :new
    end
  end

  private

  def information_params
    params.require(:information).permit(:location_id, :province_id, :date, :attachment)
  end
end
