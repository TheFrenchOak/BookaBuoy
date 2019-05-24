class BookingsController < ApplicationController
  before_action :set_booking, only: [:confirm, :reject]

  def index
    @bookings = policy_scope(Booking).order(id: :asc)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      redirect_to buoy_path(Buoy.find_by_id(params[:buoy_id].to_i))
    end
    authorize @booking
  end

  def confirm
    @booking.status = 'confirmed'
    @booking.save
    authorize @booking
    redirect_to bookings_path
  end

  def reject
    @booking.status = 'rejected'
    authorize @booking
    @booking.save
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :user_id, :buoy_id, :start_date, :end_date)
  end
end
