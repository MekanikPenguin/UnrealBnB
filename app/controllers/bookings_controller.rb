class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :accept, :reject]

  def create
    @user = current_user
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.offer = @offer
    @booking.status = "pending"
    if @booking.save
      redirect_to mybookings_path, notice: "Votre demande de réservation a été envoyée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new

  end
  def destroy
    @booking.destroy
    redirect_to mybookings_path, status: :see_other
  end

  def accept
    @booking.update(status: 'accepted')
    redirect_to myoffers_path, notice: 'Réservation acceptée.'
  end

  def reject
    @booking.update(status: 'rejected')
    redirect_to myoffers_path, notice: 'Réservation refusée.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
