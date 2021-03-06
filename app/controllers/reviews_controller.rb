class ReviewsController < ApplicationController
  before_action :set_current_booking

  def new
    @review = Review.new
    @buoy = @booking.buoy
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to buoy_path(@booking.buoy)
    else
      flash[:alert] = "Please fill the review carefully :)"
      render :new
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_current_booking
    @booking = Booking.find(params[:booking_id])
  end
end
