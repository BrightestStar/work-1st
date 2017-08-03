class InformationController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @information = Information.all
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    @information.user = current_user

    if @information.save
      redirect_to information_index_path
    else
      render :new
    end
  end

  def edit
    @information = Information.find(params[:id])

    if current_user != @information.user
      redirect_to root_path
    end
  end

  def update
    @information = Information.find(params[:id])

    if current_user != @information.user
      redirect_to root_path
    end

    if @information.update(information_params)
      redirect_to information_index_path
    else
      render :edit
    end
  end

  def destroy
    @information = Information.find(params[:id])

    if current_user != @information.user
      redirect_to root_path
    end

    @information.destroy
    redirect_to information_index_path

  end

  private

  def information_params
    params.require(:information).permit(:location_id, :province_id, :date, :attachment, :remove_attachment, :remove_images, :images => [])
  end
end
