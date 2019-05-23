class BuoysController < ApplicationController
  def index
  end

  def new
    @buyo = Buoy.new
  end

  def create
  end

  def show
  end

  private

  def buyo_params
    params.require(:Buoy).permit(:name, :photo, :category, :price, :size, :address)
  end
end
