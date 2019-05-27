class BuoysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_buoy, only: [:show]
  before_action :set_booking, only: [:show]

  def index
    @buoys = policy_scope(Buoy)
    @markers = @buoys.map do |buoy|
      {
        lat: buoy.latitude,
        lng: buoy.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { buoy: buoy }),
        image_url: helpers.asset_url('inflatable.svg')
      }
    end
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
    @marker = [
      {
        lat: @buoy.latitude,
        lng: @buoy.longitude,
        image_url: helpers.asset_url('inflatable.svg')
      }
    ]
  end

  private

  def buoy_params
    params.require(:buoy).permit(:name, :photo, :category, :price, :size, :address, :color, :description, :user_id)
  end

  def set_buoy
    @buoy = Buoy.find(params[:id])
  end

  def set_booking
    @booking = Booking.new
  end
end
