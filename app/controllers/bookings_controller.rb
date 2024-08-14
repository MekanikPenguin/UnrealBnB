class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]
  def destroy
    @booking.destroy
    redirect_to bookings_url, status: :see_other
  end

  private

  def offer_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
