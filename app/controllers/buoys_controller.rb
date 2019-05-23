class BuoysController < ApplicationController
  def index
  end

  def new
    @buoy = Buoy.new
  end

  def create
  end

  def show
  end

  private

  def buoy_params
    params.require(:buoy).permit(:name, :photo, :category, :price, :size, :address)
  end
end
