class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.buoy = @booking
      if @booking.save
        redirect_to bookings_path(@booking)
      else
        render :new
      end
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params[:booking])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :user_id, :buoy_id, :start_date, :end_date)
  end
end
