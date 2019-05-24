class BuoysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_buoy, only: [:show]

  def index
    @buoys = policy_scope(Buoy)
  end

  def new
    @buoy = Buoy.new
    authorize @buoy
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
    authorize @buoy
  end

  def show
    authorize @buoy
  end

  private

  def buoy_params
    params.require(:buoy).permit(:name, :photo, :category, :price, :size, :address, :color, :description, :user_id)
  end

  def set_buoy
    @buoy = Buoy.find(params[:id])
  end
end
