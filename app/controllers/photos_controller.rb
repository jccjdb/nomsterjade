class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
  end

  private

  def photo_params
    params.require(:photo).permit(:user, :place)
  end
end
