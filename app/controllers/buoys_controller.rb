class BuoysController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

  def index
    @buoys = Buoy.all
  end

  def new
    @buoy = Buoy.new
  end

  def create
    @buoy = Buoy.new(buoy_params)
    @buoy.user = current_user
    if @buoy.valid?
      @buoy.save
      redirect_to buoys_path
    else
      render :new
    end
  end

  def show
    set_buoy
  end

  private

  def buoy_params
    params.require(:buoy).permit(:name, :photo, :category, :price, :size, :address, :color, :description, :user_id)
  end

  def set_buoy
    @buoy = Buoy.find(params[:id])
  end
end
