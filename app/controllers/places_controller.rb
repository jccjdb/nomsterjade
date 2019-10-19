class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @places = Place.new
  end

end
