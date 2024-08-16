class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
    if params[:search].present? && params[:search][:query].present?
      @offers = Offer.search_by_name_and_description(params[:search][:query])
    else
      @offers = Offer.all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @offer = Offer.find(params[:id])
    @markers = [{
      lat: @offer.latitude,
      lng: @offer.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { offer: @offer })
    }]
    @reviews = @offer.reviews
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save!
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to myoffers_path, status: :see_other
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:name, :address, :price, :description, :image)
  end
end
