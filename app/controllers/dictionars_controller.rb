class DictionarsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @locations = Location.all
    @provinces = Province.all
  end
end
