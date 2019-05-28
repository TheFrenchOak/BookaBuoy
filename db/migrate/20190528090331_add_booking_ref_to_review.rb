class AddBookingRefToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :booking, index: true
  end
end
