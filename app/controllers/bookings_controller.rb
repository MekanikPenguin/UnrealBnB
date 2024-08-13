class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]

  def index
    @bookings = @bookings = Booking.where(user_id: current_user.id)
  end
  def destroy
    @booking.destroy
    redirect_to bookings_url, status: :see_other
  end
end
