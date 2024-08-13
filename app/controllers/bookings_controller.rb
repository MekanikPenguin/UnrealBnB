class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]

  def index
    @bookings = @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    puts "user est: #{@user}"
    @offer = Offer.find_by(params[:id])
    puts "offer est: #{@offer}"
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.offer = @offer
    if @booking.save
      redirect_to offer_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :offer_id)
  end
end
