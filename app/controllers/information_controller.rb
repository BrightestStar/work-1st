class InformationController < ApplicationController
  def index
    @information = Information.all
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)

    if @information.save
      redirect_to information_index_path
    else
      render :new
    end
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])

    if @information.update(information_params)
      redirect_to information_index_path
    else
      render :edit
    end
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    redirect_to information_index_path
  end

  private

  def information_params
    params.require(:information).permit(:location_id, :province_id, :date, :attachment)
  end
end
