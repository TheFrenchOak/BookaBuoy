class BookingsController < ApplicationController
  before_action :set_booking, only: [:confirm, :reject]

  def index
    @bookings = policy_scope(Booking)
    @bookings_owner = BookingPolicy::Scope.new(current_user, Booking).owner
  end

  def new
    @booking = Booking.new
  end

  def create
    @buoy = Buoy.find(params[:buoy_id])
    @booking = Booking.new(booking_params)
    @booking.start_date = start_date
    @booking.end_date = end_date
    @booking.user = current_user
    @booking.buoy = @buoy
    @reviews = Review.all
    if @booking.save
      redirect_to bookings_path
    else
      render 'buoys/show'
    end
    authorize @booking
  end

  def confirm
    @booking.status = 'Confirmed'
    authorize @booking
    @booking.save
    @bookings_owner = BookingPolicy::Scope.new(current_user, Booking).owner
  end

  def reject
    @booking.status = 'Rejected'
    authorize @booking
    @booking.save
    @bookings_owner = BookingPolicy::Scope.new(current_user, Booking).owner
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :date_range)
  end

  def start_date
    date = params["booking"]["start_date"].split(' to ')
    return nil if date[0].nil?

    date[0].to_date
  end

  def end_date
    date = params["booking"]["start_date"].split(' to ')
    return nil if date[1].nil?

    date[1].to_date
  end
end
