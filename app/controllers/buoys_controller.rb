class BuoysController < ApplicationController
  def index
    @buoys = Buoy.all
  end

  def new
    @buoy = Buoy.new
  end

  def create
  end

  def show
    set_buoy
  end

  private

  def buoy_params
    params.require(:buoy).permit(:name, :photo, :category, :price, :size, :address)
  end

  def set_buoy
    @buoy = Buoy.find(params[:id])
  end
end
