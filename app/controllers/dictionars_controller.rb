class DictionarsController < ApplicationController
  def index
    @locations = Location.all
    @provinces = Province.all
  end
end
