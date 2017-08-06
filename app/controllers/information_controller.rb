class InformationController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @information = Information.all

    if params[:start_on].present?
      @information = @information.where( "information.date >= ?", Date.parse(params[:start_on]).beginning_of_day )
    end

    if params[:end_on].present?
      @information = @information.where( "information.date <= ?", Date.parse(params[:end_on]).end_of_day )
    end

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

  def show
    @information = Information.find(params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "your-filename",
               encoding: 'UTF-8',
               template: "information/show.html.erb",
               no_background: false,
               layout: "pdf",
               locals: {:information => @information}
      end
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

  def pdf_print
    @information = Information.all

    if params[:start_on].present?
      @information = @information.where( "information.date >= ?", Date.parse(params[:start_on]).beginning_of_day )
    end

    if params[:end_on].present?
      @information = @information.where( "information.date <= ?", Date.parse(params[:end_on]).end_of_day )
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name_of_your_choice",
               encoding: 'UTF-8',
               template: "information/index.html.erb",
               no_background: false,
               locals: {:information => @information}
      end
    end
  end



  private

  def information_params
    params.require(:information).permit(:location_id, :province_id, :date, :attachment, :remove_attachment, :remove_images, :images => [])
  end
end
