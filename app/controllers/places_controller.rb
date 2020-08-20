class PlacesController < ApplicationController
  def new
    p @place
    @place = current_user.places.new
  end

  def create
    @place = current_user.places.new(place_params)

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
