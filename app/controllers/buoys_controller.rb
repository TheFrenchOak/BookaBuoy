class BuoysController < ApplicationController
  def index
    @buoys = Buoy.all
  end

  def new
    @buoy = Buoy.new
  end

  def create
    @buoy = Buoy.new(buoy_params)
    if @buoy.save
      redirect_to buoys_path
    else
      render :new
    end
  end

  def show
  end

  private

  def buoy_params
    params.require(:buoy).permit(:name, :photo, :category, :price, :size, :address)
  end
end
