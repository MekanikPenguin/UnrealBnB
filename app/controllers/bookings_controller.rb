class BookingsController < ApplicationController


  # REVIEW:
  # Plutot qu'un before_action avec une variable d'instance
  #preferer utiliser une method `booking` (voir dessous)
  before_action :set_booking, only: [:destroy, :accept, :reject]

  def create
    @user = current_user
    @offer = Offer.find(params[:offer_id]) # <---- SCOPING! current_user.offers.find()
    @booking = Booking.new(booking_params) # <---- SCOPING! current_user.bookings.create()
    @booking.user = @user
    @booking.offer = @offer
    @booking.status = "pending" # use Symbol instead
    if @booking.save
      redirect_to mybookings_path, notice: "Votre demande de réservation a été envoyée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def new
  # end

  # def destroy
  #   @booking.destroy
  #   redirect_to mybookings_path, status: :see_other
  # end

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

  # def booking
  #   Current.user.bookings.find(params[:id])
  #   # or current_user.bookings.find(params[:id])
  # end

  # REVIEW:
  # C'est vraiment pas beau ces methodes de setter pour les vars.
  # Ils vous apprenent ça comme ça au Wagon?
  def set_booking
    # REVIEW
    # toujours nester les methods accessors, voir method ci dessus
    @booking = Booking.find(params[:id])
  end
end
