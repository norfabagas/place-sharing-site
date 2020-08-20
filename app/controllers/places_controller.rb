class PlacesController < ApplicationController
  before_action :authenticate_user!
  def new
    @place = current_user.places.new
    @users = User.where.not(:id => current_user.id)
  end

  def create
    subscribers = params[:subscriber]
    ids = []
    subscribers.split(',').each do |index|
      ids.push(index.to_i)
    end

    @place = current_user.places.new(place_params)

    @place.subscriber = ids

    respond_to do |format|
      if @place.save
        format.html { redirect_to user_page_path, notice: 'New place shared' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @place = Place.find(params[:id])
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to user_page_path, notice: 'Place updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def destroy
    Place.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to user_page_path, notice: 'Place deleted' }
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(  :lat, 
                                    :long, 
                                    :description, 
                                    :user_id)
  end
  
end
