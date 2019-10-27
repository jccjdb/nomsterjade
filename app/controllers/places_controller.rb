class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @places = Place.paginate(page: params[:page], per_page: 4)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
  end
end
  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

  def edit
    @place = Place.find(params[:id])
      if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
    end
  end

def update
  @place = Place.find(params[:id])

  if @place.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

  @place.update_attributes(place_params)
  if @place.valid?
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden

    @place.destroy
    redirect_to root_path
  end
end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end

  def link(text, target, attributes = {})
  attributes['data-remote'] = true
  Places.paginate page: params[:page], per_page: 10
  super
end
