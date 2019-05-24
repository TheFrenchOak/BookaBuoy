class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    authorize @booking
  end

  def update
    authorize @booking
  end
end
